
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;
with Ada.Unchecked_Conversion;

with CYW43_Ctrl; use CYW43_Ctrl;
with RP2350; use RP2350;
with CYW43_Types; use CYW43_Types;

package body CYW43_LL is

   SDPCM_HEADER_LEN  : constant := 12; -- Example value, typically 12 for SDPCM
   SDPCM_SET         : constant := 2;
   WWD_STA_INTERFACE : constant := 0;
   WWD_AP_INTERFACE  : constant := 1;
   WWD_P2P_INTERFACE : constant := 2;
   WLC_SET_VAR       : constant := 263;
   SPID_BUF_SIZE     : constant := 2048;

   CYW43_IOCTL_TIMEOUT_US : constant Time_Span := Milliseconds (500);

   function CYW43_Int_From_LL (LL : CYW43_LL_Ptr) return CYW43_Internal_Ptr is
      -- Instantiate unchecked conversion from the generic address of LL
      function Cast is new Ada.Unchecked_Conversion (System.Address, CYW43_Internal_Ptr);
   begin
      return Cast (LL.all'Address);
   end CYW43_Int_From_LL;

   function Cyw43_Send_Ioctl
      (Buffer : in out CYW43_Internal; Kind, Cmd, Len : Integer;
      Buf   : U8_Array;  Iface : UInt32) return Boolean;
   procedure Cyw43_Write_Iovar_U32_U32
    (Cyw43 : in out CYW43_Internal; Var : String; Val0, Val1, Iface : UInt32);

   function CYW43_LL_GPIO_Get (Data : in out CYW43_Internal; GPIO_N : Integer;
             GPIO_EN : Boolean) return Boolean is
   begin
      return False;
   end CYW43_LL_GPIO_Get;

   --  function CYW43_LL_Init (CYW : LL_State_Type) return Boolean is
   procedure CYW43_LL_Init
      (CYW43_LL : in out CYW43_LL_Record; Data : CYW43_Internal) is
      type Local_LL_Ptr is access all CYW43_LL_Record;
      type Local_CYW43_Ptr is access all CYW43_Internal;
      LL       : aliased CYW43_LL_Record (Data.BL);   -- 'aliased' allows taking its address
      LL_Ptr   : Local_LL_Ptr := LL'Access;
      Self_Ptr : CYW43_Internal_Ptr := CYW43_Int_From_LL (LL'Access);     -- Must be a pointer type
   begin
      CYW43_LL.CB_Data := Data.SPI_Buffer;
      
   end CYW43_LL_Init;

   function CYW43_LL_GPIO_Set 
   (Data : in out CYW43_Internal; GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
      Enable_Pin : constant UInt32 := (if GPIO_EN then Shift_Left (1, GPIO_N) else 0);
   begin
      CYW43_write_iovar_u32_u32 (Data, "gpioout", Shift_Left (1, GPIO_N), Enable_Pin, WWD_STA_INTERFACE);
      return True;

   end CYW43_LL_GPIO_Set;

   -- Helper to put Little Endian 32-bit values into a buffer
   procedure Cyw43_Put_Le32 (Buffer : in out U8_Array; Offset : Integer; Val : UInt32) is
   begin
      Buffer (Offset)     := Byte (Val and 16#FF#);
      Buffer (Offset + 1) := Byte (Shift_Right(Val, 8) and 16#FF#);
      Buffer (Offset + 2) := Byte (Shift_Right(Val, 16) and 16#FF#);
      Buffer (Offset + 3) := Byte (Shift_Right(Val, 24) and 16#FF#);

end Cyw43_Put_Le32;

function Cyw43_Do_Ioctl
    (Buffer : in out CYW43_Internal; Kind, Cmd, Len : Integer;
     Buf   : U8_Array;  Iface : UInt32) return Boolean is
      Start_Time : constant Time := Clock;
      Result : Boolean := 
         Cyw43_Send_Ioctl (Buffer, Kind, Cmd, Len, Buf, Iface);
begin
   while Time_Span (Clock - Start_Time) < CYW43_IOCTL_TIMEOUT_US loop
      null;
   end loop;
   return Result;
      
end Cyw43_Do_Ioctl;

function Cyw43_Send_Ioctl
    (Buffer : in out CYW43_Internal; Kind, Cmd, Len : Integer;
     Buf   : U8_Array;  Iface : UInt32) return Boolean is
   begin
    return False;
   end Cyw43_Send_Ioctl;

   --  called as CYW43_write_iovar_u32_u32 ("gpioout", 1 << gpio_n, gpio_en ? (1 << gpio_n) : 0, WWD_STA_INTERFACE);
   procedure Cyw43_Write_Iovar_U32_U32
    (Cyw43 : in out CYW43_Internal; Var : String; Val0, Val1, Iface : UInt32) is
      --  uint8_t *buf = &self->spid_buf[SDPCM_HEADER_LEN + 16];
      --  spid_buf[...] targets a specific index in the spid_buf byte array.
      --  SDPCM_HEADER_LEN + 16 is the target index.
      --  It skips the length of the SDPCM header plus an additional 16 bytes 
      --  to set the start of the payload data
      Var_Len      : constant Integer := Var'Length;
      Var_Len_P10  : constant Integer := Var_Len + 10;
      Start_Index  : constant Integer := SDPCM_HEADER_LEN + 16;
      Buff_Last    : constant Integer := Start_Index + Var_Len + 7;
      Buffer       : U8_Array (1 .. Buff_Last);
      Result       : Boolean := False;
   begin
      --  for index in 1 .. Start_Index - 1 loop
      --     Buffer (index) := Cyw43.SPI_Buffer (index);
      --  end loop;
      
      for index in Start_Index .. Start_Index + Var_Len loop
         Buffer (index) := Character'Pos (Var (index));
      end loop;
      Buffer (Start_Index + Var_Len + 1) := 0;  -- add terminator

      --  Put Little Endian 32-bit values into a buffer
      Cyw43_Put_Le32 (Cyw43.SPI_Buffer, Var_Len + 2, Val0);
      Cyw43_Put_Le32 (Cyw43.SPI_Buffer, Var_Len + 6, Val1);

      --  Cyw43.SPI_Buffer := Buffer;
      -- cyw43_do_ioctl(self, SDPCM_SET, WLC_SET_VAR, len + 8, buf, iface);
      -- Note: We pass the slice of the buffer starting at Start_Index
      Result := Cyw43_Do_Ioctl (Cyw43, SDPCM_SET, WLC_SET_VAR, Var_Len_P10, 
            Cyw43.SPI_Buffer, Iface);

   end Cyw43_Write_Iovar_U32_U32;

end CYW43_LL;