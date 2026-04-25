--
-- Copyright (c) 2022-2025 Douglas H. Summerville, Binghamton University 
--
-- Permission is hereby granted, free of charge, to any person obtaining a 
-- copy of this software and associated documentation files (the "Software"),
-- to deal in the Software without restriction, including without limitation
-- the rights to use, copy, modify, merge, publish, distribute, sublicense,
-- and/or sell copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, Binghamton University
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
-- DEALINGS IN THE SOFTWARE.
--

with Interfaces;
with Interfaces.C;
with System;
with System.Machine_Code;
with Interfaces; use Interfaces;
with Ada.Unchecked_Conversion;

package Usb_Cdc is
   pragma Preelaborate;

   -- Use C-compatible types to ensure exact functionality with the original C interface
   subtype Int  is Interfaces.C.int;
   subtype Char is Interfaces.C.char;

   -- Global API
   procedure Configure_USBCDC;
   function USBCDC_Getchar (C : out Character) return Integer;
   function USBCDC_Putchar (C : Character) return Integer;
   function USBCDC_Is_Enumerated return Boolean;

   -- Interrupt Handler (Exported for linker/startup code)
   procedure USBCTRL_IRQ_Handler;
   pragma Export (C, USBCTRL_IRQ_Handler, "USBCTRL_IRQ_Handler");

private

   -- Constants
   USB_IRQ_PRIORITY : constant := 1;
   MAX_PACKET_SIZE  : constant := 64;
   TXBUF_SIZE       : constant := 2048;
   RXBUF_SIZE       : constant := 1024;
   USB_DPRAM_OFFSET : constant System.Address := System'To_Address(16#50100000#);

   -- Bitfield constants
   EP_BUF_FULL      : constant Unsigned_16 := 2**15;
   EP_BUF_LAST      : constant Unsigned_16 := 2**14;
   EP_DPID_1        : constant Unsigned_16 := 2**13;
   EP_DPID_0        : constant Unsigned_16 := 0;
   EP_RESET_BUFSEL  : constant Unsigned_16 := 2**12;
   EP_STALL         : constant Unsigned_16 := 2**11;
   EP_BUF_AVAIL     : constant Unsigned_16 := 2**10;

   -- Descriptor Arrays
   type Byte_Array is array (Natural range <>) of Unsigned_8;

   Language_String_Descriptor : constant Byte_Array(0 .. 3) := 
     (4, 16#03#, 16#09#, 16#04#);

   Manufacturer_String_Descriptor : constant Byte_Array(0 .. 15) :=
     (16, 16#03#,
      Character'Pos('B'), 0, Character'Pos('U'), 0, Character'Pos(' '), 0,
      Character'Pos('E'), 0, Character'Pos('C'), 0, Character'Pos('E'), 0,
      Character'Pos('.'), 0);

   Configuration_String_Descriptor : constant Byte_Array(0 .. 17) :=
     (18, 16#03#,
      Character'Pos('C'), 0, Character'Pos('O'), 0, Character'Pos('N'), 0,
      Character'Pos('F'), 0, Character'Pos('i'), 0, Character'Pos('G'), 0,
      Character'Pos('?'), 0, Character'Pos('.'), 0);

   type Descriptor_Table is array (0 .. 2) of System.Address;
   Desc_Table : constant Descriptor_Table := 
     (Language_String_Descriptor'Address,
      Manufacturer_String_Descriptor'Address,
      Configuration_String_Descriptor'Address);

   Device_Descriptor : constant Byte_Array(0 .. 17) := 
     (18, 16#01#, 16#10#, 16#01#, 16#02#, 16#00#, 16#00#, MAX_PACKET_SIZE,
      16#28#, 16#0D#, 16#04#, 16#02#, 16#01#, 16#00#, 16#01#, 16#00#, 16#00#, 16#01#);

   Config_Descriptor : constant Byte_Array(0 .. 66) := 
     (16#09#, 16#02#, 16#43#, 16#00#, 16#02#, 16#01#, 16#02#, 16#80#, 16#32#,
      16#09#, 16#04#, 16#00#, 16#00#, 16#01#, 16#02#, 16#02#, 16#01#, 16#00#,
      16#05#, 16#24#, 16#00#, 16#10#, 16#01#, 
      16#05#, 16#24#, 16#01#, 16#00#, 16#01#, 
      16#04#, 16#24#, 16#02#, 16#02#, 
      16#05#, 16#24#, 16#06#, 16#00#, 16#01#,
      16#07#, 16#05#, 16#81#, 16#03#, 16#08#, 16#00#, 16#FF#,
      16#09#, 16#04#, 16#01#, 16#00#, 16#02#, 16#0A#, 16#02#, 16#00#, 16#00#,
      16#07#, 16#05#, 16#82#, 16#02#, MAX_PACKET_SIZE, 16#00#, 16#00#,
      16#07#, 16#05#, 16#03#, 16#02#, 16#40#, 16#00#, 16#00#);

   Line_Coding : constant Byte_Array(0 .. 6) := 
     (16#00#, 16#C2#, 16#01#, 16#00#, 16#00#, 16#00#, 16#08#);

   -- Structures
   type TXBuf_T is record
      Head : Unsigned_32 := 0;
      Tail : Unsigned_32 := 0;
      Buf  : Byte_Array(0 .. TXBUF_SIZE - 1);
   end record;

   type RXBuf_T is record
      Head : Unsigned_32 := 0;
      Tail : Unsigned_32 := 0;
      Buf  : Byte_Array(0 .. RXBUF_SIZE - 1);
   end record;

   type EP_State_T is record
      Bytes_Remaining : Unsigned_32 := 0;
      Source_Data     : System.Address;
      Buffer          : System.Address;
      Data01          : Boolean;
   end record;

   type EP_Control_Reg_Pair is record
      In_Reg  : Unsigned_32 := 0;
      Out_Reg : Unsigned_32 := 0;
   end record with Pack, Size => 64;
   
   type Unsigned_16_array is array (0 .. 1) of Unsigned_16;

   type EP_Buffer_Ctrl_Regs is record
      In_Reg  : Unsigned_16_array;
      Out_Reg : Unsigned_16_array;
   end record with Pack, Size => 64;

   -- Memory Map for USB RAM
   
   subtype Byte_64_array is Byte_Array (0 .. 63);
   type EP_Control_Reg_Pair_array is array (0 .. 15) of EP_Control_Reg_Pair;
   type EP_Buffer_Ctrl_Regs_array is array (0 .. 15) of EP_Buffer_Ctrl_Regs;
   type Byte_Array_array_64 is array (0 .. 2) of Byte_Array (0 .. 63);
   type EP_State_T_array is array (0 .. 3) of EP_State_T;
   type USBRAM_T is record
      EP_Control_Reg  : EP_Control_Reg_Pair_array;
      EP_Buffer_Ctrl  : EP_Buffer_Ctrl_Regs_array;
      EP0_Buffer      : Byte_64_array;  --  Byte_Array(0 .. 63);
      EP0_Buffer_Opt  : Byte_64_array;  --  Byte_Array(0 .. 63);
      Data_Buffer     : Byte_Array_array_64;
      EP_State        : EP_State_T_array;
      TXBuf           : TXBuf_T;
      RXBuf           : RXBuf_T;
   end record;

   USBRAM : USBRAM_T with Address => USB_DPRAM_OFFSET, Volatile;

   -- Setup Packet Structure
   type Setup_Pkt_T is record
      bmRequestType : Unsigned_8;
      bRequest      : Unsigned_8;
      wValue_L      : Unsigned_8;
      wValue_H      : Unsigned_8;
      wIndex        : Unsigned_16;
      wLength       : Unsigned_16;
   end record with Pack, Size => 64;

   Setup_Packet : Setup_Pkt_T with Address => USB_DPRAM_OFFSET, Volatile;

   -- Device State
   type USB_Device_T is record
      Addr : Unsigned_8;
   end record;

   function To_USB_Device_Ptr (Addr : System.Address) return access USB_Device_T;
   --     function Convert is new Ada.Unchecked_Conversion(System.Address, System.Address);
   --     type Ptr is access all USB_Device_T;
   --     function To_Ptr is new Ada.Unchecked_Conversion(System.Address, Ptr);
   --  begin
   --     return To_Ptr(Addr);
   --  end To_USB_Device_Ptr;

   -- Helper for Ring Buffer logic
   function TxHead_Next return Unsigned_32 is ( (USBRAM.TXBuf.Head + 1) mod TXBUF_SIZE );
   function TxTail_Next return Unsigned_32 is ( (USBRAM.TXBuf.Tail + 1) mod TXBUF_SIZE );
   function TxBuf_Is_Empty return Boolean is ( USBRAM.TXBuf.Head = USBRAM.TXBuf.Tail );
   function TxBuf_Is_Full return Boolean is ( TxHead_Next = USBRAM.TXBuf.Tail );
   function TxBuf_Len return Unsigned_32 is ( (USBRAM.TXBuf.Head - USBRAM.TXBuf.Tail) and (TXBUF_SIZE - 1) );
   
   function RxHead_Next return Unsigned_32 is ( (USBRAM.RXBuf.Head + 1) mod RXBUF_SIZE );
   function RxTail_Next return Unsigned_32 is ( (USBRAM.RXBuf.Tail + 1) mod RXBUF_SIZE );
   function RxBuf_Is_Full return Boolean is ( RxHead_Next = USBRAM.RXBuf.Tail );
   function RxBuf_Is_Empty return Boolean is ( USBRAM.RXBuf.Head = USBRAM.RXBuf.Tail );

   -- Peripheral Register Definitions (Placeholders for RP2350 headers)
   type USB_Ctrl_Regs is record
      Addr_Endp       : Unsigned_32 := 0;
      Main_Ctrl       : Unsigned_32 := 0;
      SIE_Ctrl        : Unsigned_32 := 0;
      SIE_Ctrl_Set    : Unsigned_32 := 0;
      SIE_Status_Clr  : Unsigned_32 := 0;
      Ints            : Unsigned_32 := 0;
      Inte_Set        : Unsigned_32 := 0;
      Buff_Status     : Unsigned_32 := 0;
      Buff_Status_Clr : Unsigned_32 := 0;
      Usb_Muxing      : Unsigned_32 := 0;
      Usb_Pwr         : Unsigned_32 := 0;
   end record;
   USB_Base : constant System.Address := System'To_Address(16#50110000#); -- Actual RP2350 USB base
   USBCtrl : USB_Ctrl_Regs with Address => USB_Base, Volatile;

   type Reset_Regs is record
      Reset_Done : Unsigned_32 := 0;
      Reset_Clr  : Unsigned_32 := 0;
   end record;
   Resets : Reset_Regs with Address => System'To_Address(16#40010000#), Volatile;

   type Clock_Regs is record
      Clk_Usb_Ctrl     : Unsigned_32 := 0;
      Clk_Usb_Div      : Unsigned_32 := 0;
      Clk_Usb_Selected : Unsigned_32 := 0;
   end record;
   Clocks : Clock_Regs with Address => System'To_Address(16#40010000# + 16#78#), Volatile;

   type M33_Regs is record
      Nvic_Iser0 : Unsigned_32 := 0;
      Nvic_Ipr3  : Unsigned_32 := 0;
      Nvic_Icpr0 : Unsigned_32 := 0;
   end record;
   M33 : M33_Regs with Address => System'To_Address(16#E000E100#), Volatile;

   -- Masks and Helpers
   USBCTRL_INTS_BUS_RESET_MASK : constant Unsigned_32 := 2**12;
   USBCTRL_INTS_BUFF_STATUS_MASK : constant Unsigned_32 := 2**4;
   USBCTRL_INTS_SETUP_REQ_MASK   : constant Unsigned_32 := 2**16;
   USBCTRL_BUFF_STATUS_EP0_IN_MASK : constant Unsigned_32 := 2**1;
   RESETS_RESET_USBCTRL_MASK    : constant Unsigned_32 := 2**24;
   M33_NVIC_IPR3_PRI_N2_MASK    : constant Unsigned_32 := 16#FF0000#;

end USB_CDC;
--  
--  package body USB_CDC is
--  
--     procedure Clear_EP_State (EP : Integer) is
--     begin
--        USBRAM.EP_State(EP).Data01 := False;
--        USBRAM.EP_State(EP).Bytes_Remaining := 0;
--     end Clear_EP_State;
--  
--     procedure Free_EP_Output_Buf_And_Toggle_Data_Sync (EP : Unsigned_8) is
--        Ctrl_Buf_Reg_Val : Unsigned_16;
--     begin
--        if USBRAM.EP_State(Integer(EP)).Data01 then
--           Ctrl_Buf_Reg_Val := MAX_PACKET_SIZE + 16#2000#;
--        else
--           Ctrl_Buf_Reg_Val := MAX_PACKET_SIZE + 16#0000#;
--        end if;
--  
--        USBRAM.EP_Buffer_Ctrl(Integer(EP)).Out_Reg(0) := Ctrl_Buf_Reg_Val;
--        USBRAM.EP_State(Integer(EP)).Data01 := not USBRAM.EP_State(Integer(EP)).Data01;
--        USBRAM.EP_Buffer_Ctrl(Integer(EP)).Out_Reg(0) := (Ctrl_Buf_Reg_Val or 16#0400#);
--     end Free_EP_Output_Buf_And_Toggle_Data_Sync;
--  
--     procedure Prepare_In_Buffer_On_EP (EP : Unsigned_8) is
--        Desc_Len : Unsigned_32 := 0;
--        Ctrl_Val : Unsigned_16;
--        type Byte_Ptr is access all Unsigned_8;
--        function To_Byte_Ptr is new Ada.Unchecked_Conversion(System.Address, Byte_Ptr);
--        function To_Address is new Ada.Unchecked_Conversion(Byte_Ptr, System.Address);
--        Src : Byte_Ptr;
--        Dst : Byte_Ptr;
--     begin
--        Desc_Len := Unsigned_32'Min(USBRAM.EP_State(Integer(EP)).Bytes_Remaining, MAX_PACKET_SIZE);
--        USBRAM.EP_State(Integer(EP)).Bytes_Remaining := USBRAM.EP_State(Integer(EP)).Bytes_Remaining - Desc_Len;
--  
--        Src := To_Byte_Ptr(USBRAM.EP_State(Integer(EP)).Source_Data);
--        Dst := To_Byte_Ptr(USBRAM.EP_State(Integer(EP)).Buffer);
--  
--        for I in 0 .. Desc_Len - 1 loop
--           Dst.all := Src.all;
--           Src := To_Byte_Ptr(To_Address(Src) + 1);
--           Dst := To_Byte_Ptr(To_Address(Dst) + 1);
--        end loop;
--  
--        USBRAM.EP_State(Integer(EP)).Source_Data := To_Address(Src);
--  
--        if USBRAM.EP_State(Integer(EP)).Data01 then
--           Ctrl_Val := Unsigned_16(Desc_Len) + 16#A000#;
--        else
--           Ctrl_Val := Unsigned_16(Desc_Len) + 16#8000#;
--        end if;
--  
--        USBRAM.EP_Buffer_Ctrl(Integer(EP)).In_Reg(0) := Ctrl_Val;
--        USBRAM.EP_State(Integer(EP)).Data01 := not USBRAM.EP_State(Integer(EP)).Data01;
--        USBRAM.EP_Buffer_Ctrl(Integer(EP)).In_Reg(0) := Ctrl_Val or 16#0400#;
--     end Prepare_In_Buffer_On_EP;
--  
--     procedure Prepare_Out_To_Host is
--        Desc_Len : Unsigned_32 := 0;
--        Ctrl_Val : Unsigned_16;
--        type Byte_Ptr is access all Unsigned_8;
--        function To_Byte_Ptr is new Ada.Unchecked_Conversion(System.Address, Byte_Ptr);
--        function To_Address is new Ada.Unchecked_Conversion(Byte_Ptr, System.Address);
--        Dst : Byte_Ptr;
--     begin
--        if TxBuf_Is_Empty or (USBRAM.EP_Buffer_Ctrl(2).In_Reg(0) and 16#8000#) /= 0 or not USBCDC_Is_Enumerated then
--           return;
--        end if;
--  
--        Desc_Len := Unsigned_32'Min(MAX_PACKET_SIZE, TxBuf_Len);
--        Dst := To_Byte_Ptr(USBRAM.EP_State(2).Buffer);
--  
--        for I in 0 .. Desc_Len - 1 loop
--           Dst.all := USBRAM.TXBuf.Buf(Integer(USBRAM.TXBuf.Tail));
--           Dst := To_Byte_Ptr(To_Address(Dst) + 1);
--           USBRAM.TXBuf.Tail := TxTail_Next;
--        end loop;
--  
--        if USBRAM.EP_State(2).Data01 then
--           Ctrl_Val := Unsigned_16(Desc_Len) + 16#A000#;
--        else
--           Ctrl_Val := Unsigned_16(Desc_Len) + 16#8000#;
--        end if;
--  
--        USBRAM.EP_Buffer_Ctrl(2).In_Reg(0) := Ctrl_Val;
--        USBRAM.EP_State(2).Data01 := not USBRAM.EP_State(2).Data01;
--        USBRAM.EP_Buffer_Ctrl(2).In_Reg(0) := Ctrl_Val or 16#0400#;
--     end Prepare_Out_To_Host;
--  
--     procedure USBCTRL_IRQ_Handler is
--        Ints_Req : Unsigned_32 := USBCtrl.Ints;
--        EP_Status : Unsigned_32 := 0;
--        Device_Ptr : access USB_Device_T := To_USB_Device_Ptr(USBRAM.EP0_Buffer_Opt'Address);
--        Desc_Len : Unsigned_8 := 0;
--        Desc_Ptr : System.Address := System.Null_Address;
--        W_Request : Unsigned_16;
--        type Byte_Ptr is access all Unsigned_8;
--        function To_Byte_Ptr is new Ada.Unchecked_Conversion(System.Address, Byte_Ptr);
--        function To_Address is new Ada.Unchecked_Conversion(Byte_Ptr, System.Address);
--        Ep3_Buf : Byte_Ptr;
--        Byte_Cnt : Unsigned_16;
--        Idx : Unsigned_16;
--     begin
--        if (Ints_Req and USBCTRL_INTS_BUS_RESET_MASK) /= 0 then
--           USBCtrl.Addr_Endp := 0;
--           Device_Ptr.Addr := 0;
--           for I in 0 .. 3 loop
--              Clear_EP_State(I);
--           end loop;
--           Free_EP_Output_Buf_And_Toggle_Data_Sync(3);
--        end if;
--  
--        if (Ints_Req and USBCTRL_INTS_BUFF_STATUS_MASK) /= 0 then
--           EP_Status := USBCtrl.Buff_Status;
--  
--           if (EP_Status and USBCTRL_BUFF_STATUS_EP0_IN_MASK) /= 0 then
--              if Device_Ptr.Addr /= 0 then
--                 USBCtrl.Addr_Endp := Unsigned_32(Device_Ptr.Addr);
--                 Device_Ptr.Addr := 0;
--              elsif USBRAM.EP_State(0).Bytes_Remaining /= 0 then
--                 Prepare_In_Buffer_On_EP(0);
--              end if;
--           end if;
--  
--           if (USBRAM.EP_Buffer_Ctrl(3).Out_Reg(0) and 16#0400#) = 0 then
--              Byte_Cnt := USBRAM.EP_Buffer_Ctrl(3).Out_Reg(0) and 16#3FF#;
--              Idx := 0;
--              Ep3_Buf := To_Byte_Ptr(USBRAM.EP_State(3).Buffer);
--              while Idx < Byte_Cnt and not RxBuf_Is_Full loop
--                 USBRAM.RXBuf.Buf(Integer(USBRAM.RXBuf.Head)) := Ep3_Buf.all;
--                 USBRAM.RXBuf.Head := RxHead_Next;
--                 Ep3_Buf := To_Byte_Ptr(To_Address(Ep3_Buf) + 1);
--                 Idx := Idx + 1;
--              end loop;
--              Free_EP_Output_Buf_And_Toggle_Data_Sync(3);
--           end if;
--        end if;
--  
--        if (Ints_Req and USBCTRL_INTS_SETUP_REQ_MASK) /= 0 then
--           USBRAM.EP_State(0).Data01 := True;
--           USBRAM.EP_State(0).Bytes_Remaining := 0;
--           USBRAM.EP_Buffer_Ctrl(0).Out_Reg(0) := 16#2400#;
--  
--           W_Request := Unsigned_16(Setup_Packet.bmRequestType);
--           W_Request := W_Request or (Shift_Left(Unsigned_16(Setup_Packet.bRequest), 8));
--  
--           case W_Request is
--              when 16#0680# => -- Std Dev Get Descriptor
--                 case Setup_Packet.wValue_H is
--                    when 16#01# => -- device
--                       Desc_Ptr := Device_Descriptor'Address;
--                       Desc_Len := Device_Descriptor'Length;
--                    when 16#02# => -- config
--                       Desc_Ptr := Config_Descriptor'Address;
--                       Desc_Len := Config_Descriptor'Length;
--                    when 16#03# => -- string
--                       if Setup_Packet.wValue_L < 3 then
--                          declare
--                             type Table_Access is access all Descriptor_Table;
--                             function To_Table is new Ada.Unchecked_Conversion(System.Address, Table_Access);
--                             T : Table_Access := To_Table(Desc_Table'Address);
--                          begin
--                             Desc_Ptr := T(Integer(Setup_Packet.wValue_L));
--                             Desc_Len := To_Byte_Ptr(Desc_Ptr).all;
--                          end;
--                       end if;
--                    when others => null;
--                 end case;
--              when 16#0500# => -- Set Address
--                 Device_Ptr.Addr := Setup_Packet.wValue_L;
--              when 16#0102# | 16#2021# | 16#2221# | 16#0900# =>
--                 null;
--              when 16#21A1# => -- Get Line Coding
--                 Desc_Ptr := Line_Coding'Address;
--                 Desc_Len := Line_Coding'Length;
--              when others => null;
--           end case;
--  
--           USBRAM.EP_State(0).Bytes_Remaining := Unsigned_32'Min(Unsigned_32(Desc_Len), Unsigned_32(Setup_Packet.wLength));
--           USBRAM.EP_State(0).Source_Data := Desc_Ptr;
--           Prepare_In_Buffer_On_EP(0);
--        end if;
--  
--        Prepare_Out_To_Host;
--        USBCtrl.Buff_Status_Clr := 16#FFFFFFFF#;
--        USBCtrl.Sie_Status_Clr := 16#FFFFFFFF#;
--     end USBCTRL_IRQ_Handler;
--  
--     procedure Configure_USBCDC is
--        type U32_Ptr is access all Unsigned_32;
--        function To_U32_Ptr is new Ada.Unchecked_Conversion(System.Address, U32_Ptr);
--        Ptr : U32_Ptr;
--     begin
--        Clocks.Clk_Usb_Ctrl := 0 or 16#01#; -- AUXSRC 0, Enable
--        while (Clocks.Clk_Usb_Selected and 16#1#) = 0 loop
--           null;
--        end loop;
--  
--        Clocks.Clk_Usb_Div := 3 * 2**16; -- Integer divider 3 (for 48MHz from 144MHz)
--  
--        Resets.Reset_Clr := RESETS_RESET_USBCTRL_MASK;
--        while (Resets.Reset_Done and RESETS_RESET_USBCTRL_MASK) = 0 loop
--           null;
--        end loop;
--  
--        for I in 0 .. (4096 / 4) - 1 loop
--           Ptr := To_U32_Ptr(USB_DPRAM_OFFSET + System.Storage_Offset(I * 4));
--           Ptr.all := 0;
--        end loop;
--  
--        M33.Nvic_Iser0 := 2**14;
--        M33.Nvic_Ipr3 := (M33.Nvic_Ipr3 and not M33_NVIC_IPR3_PRI_N2_MASK) or Shift_Left(Unsigned_32(USB_IRQ_PRIORITY), 16);
--        M33.Nvic_Icpr0 := 2**14;
--  
--        USBCtrl.Usb_Muxing := 16#01# or 16#02#; -- TO_PHY, SOFTCON
--        USBCtrl.Usb_Pwr := 16#01# or 16#04#; -- VBUS_DETECT, OVERRIDE
--  
--        USBCtrl.Main_Ctrl := 16#01#; -- Controller Enable
--  
--        USBCtrl.Sie_Ctrl := 16#01# or 16#200000#; -- EP0_INT_1BUF, RPU_OPT
--        USBCtrl.Inte_Set := 16#1000# or 16#10000# or 16#10#; -- Reset, Setup, Buff
--  
--        USBRAM.EP_State(0).Buffer := USBRAM.EP0_Buffer'Address;
--  
--        USBRAM.EP_Control_Reg(1).In_Reg := 2**31 or 2**29 or USBRAM_OFFSET(USBRAM.Data_Buffer(0)'Address);
--        USBRAM.EP_State(1).Buffer := USBRAM.Data_Buffer(0)'Address;
--  
--        USBRAM.EP_Control_Reg(2).In_Reg := 2**31 or 2**29 or Shift_Left(2, 26) or USBRAM_OFFSET(USBRAM.Data_Buffer(1)'Address);
--        USBRAM.EP_State(2).Buffer := USBRAM.Data_Buffer(1)'Address;
--  
--        USBRAM.EP_Control_Reg(3).Out_Reg := 2**31 or 2**29 or Shift_Left(2, 26) or USBRAM_OFFSET(USBRAM.Data_Buffer(2)'Address);
--        USBRAM.EP_State(3).Buffer := USBRAM.Data_Buffer(2)'Address;
--  
--        USBCtrl.Sie_Ctrl_Set := 2**16; -- PULLUP_EN
--     end Configure_USBCDC;
--  
--     function USBCDC_Getchar (C : out Character) return Integer is
--     begin
--        if RxBuf_Is_Empty then
--           return 0;
--        else
--           C := Character'Val(USBRAM.RXBuf.Buf(Integer(USBRAM.RXBuf.Tail)));
--           USBRAM.RXBuf.Tail := RxTail_Next;
--           return 1;
--        end if;
--     end USBCDC_Getchar;
--  
--     function USBCDC_Putchar (C : Character) return Integer is
--        Primask : Unsigned_32 := 0;
--     begin
--        if TxBuf_Is_Full then
--           return 0;
--        end if;
--  
--        System.Machine_Code.Asm ("MRS %0, primask", Outputs => Unsigned_32'Output ("=r", Primask), Volatile => True);
--        System.Machine_Code.Asm ("CPSID I", Volatile => True);
--  
--        USBRAM.TXBuf.Buf(Integer(USBRAM.TXBuf.Head)) := Character'Pos(C);
--        USBRAM.TXBuf.Head := TxHead_Next;
--        Prepare_Out_To_Host;
--  
--        System.Machine_Code.Asm ("MSR primask, %0", Inputs => Unsigned_32'Input ("r", Primask), Volatile => True);
--        return 1;
--     end USBCDC_Putchar;
--  
--     function USBCDC_Is_Enumerated return Boolean is
--     begin
--        return (USBCtrl.Addr_Endp and 16#7F#) /= 0;
--     end USBCDC_Is_Enumerated;
--  
--  end USB_CDC;
--  
--     -- Equivalent to void configure_usbcdc();
--     procedure Configure_Usb_Cdc;
--  
--     -- Equivalent to _Bool usbcdc_is_enumerated();
--     -- Returns Boolean (maps to C99 _Bool when used with Convention C)
--     function Usb_Cdc_Is_Enumerated return Boolean;
--  
--     -- Equivalent to int usbcdc_getchar( char *c);
--     -- The pointer char *c is translated to an 'out' parameter which passes by reference in C convention
--     function Usb_Cdc_Getchar (C : out Char) return Int;
--  
--     -- Equivalent to int usbcdc_putchar( char c);
--     function Usb_Cdc_Putchar (C : Char) return Int;
--  
--     -- Ensure the subprograms follow C calling conventions for exact compatibility
--     pragma Convention (C, Configure_Usb_Cdc);
--     pragma Convention (C, Usb_Cdc_Is_Enumerated);
--     pragma Convention (C, Usb_Cdc_Getchar);
--     pragma Convention (C, Usb_Cdc_Putchar);

--  end Usb_Cdc;
