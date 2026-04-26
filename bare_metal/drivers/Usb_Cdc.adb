with System;
with System.Machine_Code;
with System.Storage_Elements; use System.Storage_Elements;
with Interfaces; use Interfaces;
with Ada.Unchecked_Conversion;

package body USB_CDC is
   
   
   function USBRAM_OFFSET (Addr : System.Address) return Unsigned_32;

   procedure Clear_EP_State (EP : Integer) is
   begin
      USBRAM.EP_State (EP).Data01 := False;
      USBRAM.EP_State (EP).Bytes_Remaining := 0;
   end Clear_EP_State;

   procedure Free_EP_Output_Buf_And_Toggle_Data_Sync (EP : Unsigned_8) is
      Ctrl_Buf_Reg_Val : Unsigned_16;
   begin
      if USBRAM.EP_State (Integer (EP)).Data01 then
         Ctrl_Buf_Reg_Val := MAX_PACKET_SIZE + 16#2000#;
      else
         Ctrl_Buf_Reg_Val := MAX_PACKET_SIZE + 16#0000#;
      end if;

      USBRAM.EP_Buffer_Ctrl (Integer (EP)).Out_Reg (0) := Ctrl_Buf_Reg_Val;
      USBRAM.EP_State (Integer (EP)).Data01 := not USBRAM.EP_State (Integer (EP)).Data01;
      USBRAM.EP_Buffer_Ctrl (Integer (EP)).Out_Reg (0) := (Ctrl_Buf_Reg_Val or 16#0400#);
   end Free_EP_Output_Buf_And_Toggle_Data_Sync;

   procedure Prepare_In_Buffer_On_EP (EP : Unsigned_8) is
      Desc_Len : Unsigned_32;
      Ctrl_Val : Unsigned_16;
      type Byte_Ptr is access all Unsigned_8;
      function To_Byte_Ptr is new Ada.Unchecked_Conversion (System.Address, Byte_Ptr);
      function To_Address is new Ada.Unchecked_Conversion (Byte_Ptr, System.Address);
      Src      : Byte_Ptr;
      Dst      : Byte_Ptr;
   begin
      Desc_Len := Unsigned_32'Min (USBRAM.EP_State (Integer (EP)).Bytes_Remaining, MAX_PACKET_SIZE);
      USBRAM.EP_State (Integer (EP)).Bytes_Remaining := USBRAM.EP_State (Integer (EP)).Bytes_Remaining - Desc_Len;
      
      Src := To_Byte_Ptr (USBRAM.EP_State (Integer (EP)).Source_Data);
      Dst := To_Byte_Ptr (USBRAM.EP_State (Integer (EP)).Buffer);

      for I in 0 .. Desc_Len - 1 loop
         Dst.all := Src.all;
         Src := To_Byte_Ptr (To_Address (Src) + 1);
         Dst := To_Byte_Ptr (To_Address (Dst) + 1);
      end loop;
      
      USBRAM.EP_State (Integer (EP)).Source_Data := To_Address (Src);

      if USBRAM.EP_State (Integer (EP)).Data01 then
         Ctrl_Val := Unsigned_16 (Desc_Len) + 16#A000#;
      else
         Ctrl_Val := Unsigned_16 (Desc_Len) + 16#8000#;
      end if;

      USBRAM.EP_Buffer_Ctrl (Integer (EP)).In_Reg (0) := Ctrl_Val;
      USBRAM.EP_State (Integer (EP)).Data01 := not USBRAM.EP_State (Integer (EP)).Data01;
      USBRAM.EP_Buffer_Ctrl (Integer (EP)).In_Reg (0) := Ctrl_Val or 16#0400#;
   end Prepare_In_Buffer_On_EP;

   procedure Prepare_Out_To_Host is
      Desc_Len : Unsigned_32;
      Ctrl_Val : Unsigned_16;
      type Byte_Ptr is access all Unsigned_8;
      function To_Byte_Ptr is new Ada.Unchecked_Conversion (System.Address, Byte_Ptr);
      function To_Address is new Ada.Unchecked_Conversion (Byte_Ptr, System.Address);
      Dst      : Byte_Ptr;
   begin
      if TxBuf_Is_Empty or (USBRAM.EP_Buffer_Ctrl (2).In_Reg (0) and 16#8000#) /= 0 or not USBCDC_Is_Enumerated then
         return;
      end if;

      Desc_Len := Unsigned_32'Min (MAX_PACKET_SIZE, TxBuf_Len);
      Dst := To_Byte_Ptr (USBRAM.EP_State (2).Buffer);

      for I in 0 .. Desc_Len - 1 loop
         Dst.all := USBRAM.TXBuf.Buf (Integer (USBRAM.TXBuf.Tail));
         Dst := To_Byte_Ptr (To_Address (Dst) + 1);
         USBRAM.TXBuf.Tail := TxTail_Next;
      end loop;

      if USBRAM.EP_State (2).Data01 then
         Ctrl_Val := Unsigned_16 (Desc_Len) + 16#A000#;
      else
         Ctrl_Val := Unsigned_16 (Desc_Len) + 16#8000#;
      end if;

      USBRAM.EP_Buffer_Ctrl (2).In_Reg (0) := Ctrl_Val;
      USBRAM.EP_State (2).Data01 := not USBRAM.EP_State (2).Data01;
      USBRAM.EP_Buffer_Ctrl (2).In_Reg (0) := Ctrl_Val or 16#0400#;
   end Prepare_Out_To_Host;

   procedure USBCTRL_IRQ_Handler is
      Ints_Req   : Unsigned_32 := USBCtrl.Ints;
      EP_Status  : Unsigned_32;
      Device_Ptr : access USB_Device_T := To_USB_Device_Ptr (USBRAM.EP0_Buffer_Opt'Address);
      Desc_Len   : Unsigned_8 := 0;
      Desc_Ptr   : System.Address := System.Null_Address;
      W_Request  : Unsigned_16;
      type Byte_Ptr is access all Unsigned_8;
      function To_Byte_Ptr is new Ada.Unchecked_Conversion (System.Address, Byte_Ptr);
      function To_Address is new Ada.Unchecked_Conversion (Byte_Ptr, System.Address);
      Ep3_Buf    : Byte_Ptr;
      Byte_Cnt   : Unsigned_16;
      Idx        : Unsigned_16;
   begin
      if (Ints_Req and USBCTRL_INTS_BUS_RESET_MASK) /= 0 then
         USBCtrl.Addr_Endp := 0;
         Device_Ptr.Addr := 0;
         for I in 0 .. 3 loop
            Clear_EP_State (I);
         end loop;
         Free_EP_Output_Buf_And_Toggle_Data_Sync (3);
      end if;

      if (Ints_Req and USBCTRL_INTS_BUFF_STATUS_MASK) /= 0 then
         EP_Status := USBCtrl.Buff_Status;
         
         if (EP_Status and USBCTRL_BUFF_STATUS_EP0_IN_MASK) /= 0 then
            if Device_Ptr.Addr /= 0 then
               USBCtrl.Addr_Endp := Unsigned_32 (Device_Ptr.Addr);
               Device_Ptr.Addr := 0;
            elsif USBRAM.EP_State (0).Bytes_Remaining /= 0 then
               Prepare_In_Buffer_On_EP (0);
            end if;
         end if;

         if (USBRAM.EP_Buffer_Ctrl (3).Out_Reg (0) and 16#0400#) = 0 then
            Byte_Cnt := USBRAM.EP_Buffer_Ctrl (3).Out_Reg (0) and 16#3FF#;
            Idx := 0;
            Ep3_Buf := To_Byte_Ptr (USBRAM.EP_State (3).Buffer);
            while Idx < Byte_Cnt and not RxBuf_Is_Full loop
               USBRAM.RXBuf.Buf (Integer (USBRAM.RXBuf.Head)) := Ep3_Buf.all;
               USBRAM.RXBuf.Head := RxHead_Next;
               Ep3_Buf := To_Byte_Ptr (To_Address (Ep3_Buf) + 1);
               Idx := Idx + 1;
            end loop;
            Free_EP_Output_Buf_And_Toggle_Data_Sync (3);
         end if;
      end if;

      if (Ints_Req and USBCTRL_INTS_SETUP_REQ_MASK) /= 0 then
         USBRAM.EP_State (0).Data01 := True;
         USBRAM.EP_State (0).Bytes_Remaining := 0;
         USBRAM.EP_Buffer_Ctrl (0).Out_Reg (0) := 16#2400#;

         W_Request := Unsigned_16 (Setup_Packet.bmRequestType);
         W_Request := W_Request or (Shift_Left (Unsigned_16 (Setup_Packet.bRequest), 8));

         case W_Request is
            when 16#0680# => -- Std Dev Get Descriptor
               case Setup_Packet.wValue_H is
                  when 16#01# => -- device
                     Desc_Ptr := Device_Descriptor'Address;
                     Desc_Len := Device_Descriptor'Length;
                  when 16#02# => -- config
                     Desc_Ptr := Config_Descriptor'Address;
                     Desc_Len := Config_Descriptor'Length;
                  when 16#03# => -- string
                     if Setup_Packet.wValue_L < 3 then
                        declare
                           type Table_Access is access all Descriptor_Table;
                           function To_Table is new Ada.Unchecked_Conversion (System.Address, Table_Access);
                           T : Table_Access := To_Table (Desc_Table'Address);
                        begin
                           Desc_Ptr := T (Integer (Setup_Packet.wValue_L));
                           Desc_Len := To_Byte_Ptr (Desc_Ptr).all;
                        end;
                     end if;
                  when others => null;
               end case;
            when 16#0500# => -- Set Address
               Device_Ptr.Addr := Setup_Packet.wValue_L;
            when 16#0102# | 16#2021# | 16#2221# | 16#0900# =>
               null;
            when 16#21A1# => -- Get Line Coding
               Desc_Ptr := Line_Coding'Address;
               Desc_Len := Line_Coding'Length;
            when others => null;
         end case;

         USBRAM.EP_State (0).Bytes_Remaining := Unsigned_32'Min (Unsigned_32 (Desc_Len), Unsigned_32 (Setup_Packet.wLength));
         USBRAM.EP_State (0).Source_Data := Desc_Ptr;
         Prepare_In_Buffer_On_EP (0);
      end if;

      Prepare_Out_To_Host;
      USBCtrl.Buff_Status_Clr := 16#FFFFFFFF#;
      USBCtrl.Sie_Status_Clr := 16#FFFFFFFF#;
   end USBCTRL_IRQ_Handler;

   procedure Configure_USBCDC is
      use System.Machine_Code;
      type U32_Ptr is access all Unsigned_32;
      function To_U32_Ptr is new Ada.Unchecked_Conversion (System.Address, U32_Ptr);
      Ptr : U32_Ptr;
   begin
      --  Clocks.Clk_Usb_Ctrl := 0 or 16#01#; -- AUXSRC 0, Enable
      --  while (Clocks.Clk_Usb_Selected and 16#1#) = 0 loop
      --     null;
      --  end loop;
      declare
         Timeout : Natural := 10_000_000;
      begin
         Clocks.Clk_Usb_Ctrl := 16#01#;

         while (Clocks.Clk_Usb_Selected and 16#1#) = 0 loop
            Timeout := Timeout - 1;
            exit when Timeout = 0;
         end loop;

         if Timeout = 0 then
            -- Put a breakpoint here
            Asm ("bkpt #0", Volatile => True);
         end if;
      end;

      Clocks.Clk_Usb_Div := 3 * 2 ** 16; -- Integer divider 3 (for 48MHz from 144MHz)

      Resets.Reset_Clr := RESETS_RESET_USBCTRL_MASK;
      while (Resets.Reset_Done and RESETS_RESET_USBCTRL_MASK) = 0 loop
         null;
      end loop;

      for I in 0 .. (4096 / 4) - 1 loop
         Ptr := To_U32_Ptr (USB_DPRAM_OFFSET + Storage_Offset (I * 4));
         Ptr.all := 0;
      end loop;

      M33.Nvic_Iser0 := 2 ** 14;
      M33.Nvic_Ipr3 := (M33.Nvic_Ipr3 and not M33_NVIC_IPR3_PRI_N2_MASK) or Shift_Left (Unsigned_32 (USB_IRQ_PRIORITY), 16);
      M33.Nvic_Icpr0 := 2 ** 14;

      USBCtrl.Usb_Muxing := 16#01# or 16#02#; -- TO_PHY, SOFTCON
      USBCtrl.Usb_Pwr := 16#01# or 16#04#; -- VBUS_DETECT, OVERRIDE

      USBCtrl.Main_Ctrl := 16#01#; -- Controller Enable

      USBCtrl.Sie_Ctrl := 16#01# or 16#200000#; -- EP0_INT_1BUF, RPU_OPT
      USBCtrl.Inte_Set := 16#1000# or 16#10000# or 16#10#; -- Reset, Setup, Buff

      USBRAM.EP_State (0).Buffer := USBRAM.EP0_Buffer'Address;
      
      USBRAM.EP_Control_Reg (1).In_Reg := 2 ** 31 or 2 ** 29 or USBRAM_OFFSET (USBRAM.Data_Buffer (0)'Address);
      USBRAM.EP_State (1).Buffer := USBRAM.Data_Buffer (0)'Address;

      USBRAM.EP_Control_Reg (2).In_Reg := 2 ** 31 or 2 ** 29 or Shift_Left (2, 26) or USBRAM_OFFSET (USBRAM.Data_Buffer (1)'Address);
      USBRAM.EP_State (2).Buffer := USBRAM.Data_Buffer (1)'Address;

      USBRAM.EP_Control_Reg (3).Out_Reg := 2 ** 31 or 2 ** 29 or Shift_Left (2, 26) or USBRAM_OFFSET (USBRAM.Data_Buffer (2)'Address);
      USBRAM.EP_State (3).Buffer := USBRAM.Data_Buffer (2)'Address;

      USBCtrl.Sie_Ctrl_Set := 2 ** 16; -- PULLUP_EN
   end Configure_USBCDC;
   
   function To_USB_Device_Ptr (Addr : System.Address) return access USB_Device_T is
      function Convert is new Ada.Unchecked_Conversion (System.Address, System.Address);
      type Ptr is access all USB_Device_T;
      function To_Ptr is new Ada.Unchecked_Conversion (System.Address, Ptr);
   begin
      return To_Ptr (Addr);
   end To_USB_Device_Ptr;

   function USBCDC_Getchar (C : out Character) return Integer is
   begin
      if RxBuf_Is_Empty then
         return 0;
      else
         C := Character'Val (USBRAM.RXBuf.Buf (Integer (USBRAM.RXBuf.Tail)));
         USBRAM.RXBuf.Tail := RxTail_Next;
         return 1;
      end if;
   end USBCDC_Getchar;

   function USBCDC_Putchar (C : Character) return Integer is
      use System.Machine_Code;
      Primask : Unsigned_32;
   begin
      if TxBuf_Is_Full then
         return 0;
      end if;

      Asm ("MRS %0, primask",
           Outputs => Unsigned_32'Asm_Output ("=r", Primask), Volatile => True);
      Asm ("CPSID I", Volatile => True);

      USBRAM.TXBuf.Buf (Integer (USBRAM.TXBuf.Head)) := Character'Pos (C);
      USBRAM.TXBuf.Head := TxHead_Next;
      Prepare_Out_To_Host;

      Asm ("MSR primask, %0",
           Inputs => Unsigned_32'Asm_Input ("r", Primask), Volatile => True);
      return 1;
      
   end USBCDC_Putchar;

   function USBCDC_Is_Enumerated return Boolean is
   begin
      return (USBCtrl.Addr_Endp and 16#7F#) /= 0;
   end USBCDC_Is_Enumerated;
   
   function USBRAM_OFFSET (Addr : System.Address) return Unsigned_32 is
   begin
      return Unsigned_32 (To_Integer (Addr)) and 16#FFFF#;
   end USBRAM_OFFSET;

end USB_CDC;
