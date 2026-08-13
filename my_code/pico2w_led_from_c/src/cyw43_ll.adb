
with Interfaces; use Interfaces;

with Ada.Real_Time; use Ada.Real_Time;

with RP2350; use RP2350;
with System.Atomic_Primitives;

package body CYW43_LL is

   SDPCM_HEADER_LEN  : constant := 12; -- Example value, typically 12 for SDPCM
   SDPCM_SET         : constant := 2;
   WWD_STA_INTERFACE : constant := 0;
   WWD_AP_INTERFACE  : constant := 1;
   WWD_P2P_INTERFACE : constant := 2;
   WLC_SET_VAR       : constant := 263;
   SPID_BUF_SIZE     : constant := 2048;

   CYW43_IOCTL_TIMEOUT_US : constant Duration := Duration (Milliseconds (500));

   type U8_Array is array (Positive range <>) of Byte;
   type U32_Array is array (Positive range <>) of UInt32;

   -- Type definitions to match the C structure in Cyw43_Intternal.h
   type Cyw43_Int (BL : Positive) is record
      Startup_T0       : uint32;
      Last_Header      : U32_Array (1 .. 2);
      Bus_Is_Up        : Boolean := False;
      SPI_Buffer       : U32_Array (1 .. BL);
   end record;

   function Cyw43_Send_Ioctl
      (Buffer : in out Cyw43_Int; Kind, Cmd, Len : Integer;
      Buf   : U8_Array;  Iface : Unsigned_32) return Boolean;
      
   procedure Cyw43_Write_Iovar_U32_U32 (Var : String; Val0, Val1, Iface : uint32);

   function CYW43_LL_GPIO_Get (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
   begin
      return False;
   end CYW43_LL_GPIO_Get;

   function CYW43_LL_GPIO_Set (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
      Enable_Pin : constant UInt32 := if GPIO_EN then Shift_Left (1, GPIO_N) else 0;
   begin
      CYW43_write_iovar_u32_u32 ("gpioout", Shift_Left (1, GPIO_N), Enable_Pin, WWD_STA_INTERFACE);
      return True;

   end CYW43_LL_GPIO_Set;

   -- Helper to put Little Endian 32-bit values into a buffer
   procedure Cyw43_Put_Le32 (Buf : in out U8_Array; Offset : Integer; Val : UInt32) is
   begin
      Buf (Offset)     := Byte (Val and 16#FF#);
      Buf (Offset + 1) := Byte (Shift_Right(Val, 8) and 16#FF#);
      Buf (Offset + 2) := Byte (Shift_Right(Val, 16) and 16#FF#);
      Buf (Offset + 3) := Byte (Shift_Right(Val, 24) and 16#FF#);

   end Cyw43_Put_Le32;

   function Cyw43_Do_Ioctl
    (Buffer : in out Cyw43_Int; Kind, Cmd, Len : Integer;
     Buf   : U8_Array;  Iface : Unsigned_32) return Boolean is
      Start_Time : constant Time := Clock;
      Result : Boolean := 
         Cyw43_Send_Ioctl (Buffer, Kind, Cmd, Len, Buf, Iface);
begin
   while Duration (Clock - Start_Time) < CYW43_IOCTL_TIMEOUT_US loop
      null;
   end loop;
   return Result;
      
end Cyw43_Do_Ioctl;

function Cyw43_Send_Ioctl
    (Buffer : in out Cyw43_Int; Kind, Cmd, Len : Integer;
     Buf   : U8_Array;  Iface : Unsigned_32) return Boolean is
   begin
    return False;
   end Cyw43_Send_Ioctl;

   --  called as CYW43_write_iovar_u32_u32 ("gpioout", 1 << gpio_n, gpio_en ? (1 << gpio_n) : 0, WWD_STA_INTERFACE);
   procedure Cyw43_Write_Iovar_U32_U32
    (Cyw43 : in out Cyw43_Int; Var : String; Val0, Val1, Iface : uint32) is
      --  uint8_t *buf = &self->spid_buf[SDPCM_HEADER_LEN + 16];
      --  skips protocol headers to find the start of the payload data
      --  spid_buf[...] targets a specific index in the spid_buf byte array.
      --  SDPCM_HEADER_LEN + 16 is the target index.
      --  It skips the length of the SDPCM header plus an additional 16 bytes.
      -- Creates a view of the buffer starting after the header and metadata

      --  Use array slices to retain bounds checking and prevent buffer overflows
      subtype Payload_Slice is Storage_Array
         (Cyw43.SPI_Buffer'First + SDPCM_HEADER_LEN + 16 .. Cyw43.SPI_Buffer'Last);
      -- You can overlay or rename this slice safely
      Buf : Payload_Slice renames Cyw43.SPI_Buffer
         (Cyw43.SPI_Buffer'First + SDPCM_HEADER_LEN + 16 .. Cyw43.SPI_Buffer'Last);

      Var_Len      : constant Integer := Var'Length;
      Var_Len_P8   : constant Integer := Var_Len + 8;
      Start_Index  : constant Integer := SDPCM_HEADER_LEN + 16;
      --  Buff_Last    : constant Integer := Start_Index + Var_Len + 7;
      --  Buffer       : U8_Array (1 .. Buff_Last);
      --  size_t len = strlen(var) + 1;
      
      -- Unsigned_8 use a slice or manual copy to represent the buffer pointer logic
      -- In Ada, we work with the indices of the Spid_Buf directly.
   begin
      --  memcpy(buf, var, len);
      for index in 1 .. Var_Len loop
         Buf (index) := Var (index);
      end loop;
      -- cyw43_put_le32(buf + len, val0);
      --  Put Little Endian 32-bit values into a buffer
      Cyw43_Put_Le32 (Buf, Var_Len, Val0);

      -- cyw43_put_le32(buf + len + 4, val1);
      Cyw43_Put_Le32 (Buf, Var_Len + 4, Val1);

      -- cyw43_do_ioctl(self, SDPCM_SET, WLC_SET_VAR, len + 8, buf, iface);
      -- Note: We pass the slice of the buffer starting at Start_Index
      Cyw43_Do_Ioctl (Cyw43, SDPCM_SET, WLC_SET_VAR, Var_Len_P8, 
            Buf, Iface);

   end Cyw43_Write_Iovar_U32_U32;

end CYW43_LL;