
with Interfaces; use Interfaces;

with Ada.Real_Time;

with RP2350; use RP2350;

package body CYW43_LL is

   SDPCM_HEADER_LEN : constant := 12; -- Example value, typically 12 for SDPCM
   SDPCM_SET        : constant := 2;
   WLC_SET_VAR      : constant := 263;
   SPID_BUF_SIZE    : constant := 2048;

   type U8_Array is array (Positive range <>) of UInt8;
   -- Type definitions to match the C structure
   type Cyw43_Int_T is record
      Spid_Buf : U8_Array (0 .. SPID_BUF_SIZE - 1);
   end record;

   function CYW43_LL_GPIO_Get (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
   begin
      return False;
   end CYW43_LL_GPIO_Get;

   function CYW43_LL_GPIO_Set (GPIO_N : Integer; GPIO_EN : Boolean) return Boolean is
   begin
      CYW43_write_iovar_u32_u32 ("gpioout", 1 << gpio_n, gpio_en ? (1 << gpio_n) : 0, WWD_STA_INTERFACE);
      return True;
   end CYW43_LL_GPIO_Set;

   -- Helper to put Little Endian 32-bit values into a buffer
   procedure Cyw43_Put_Le32 (Buf : in out U8_Array; Offset : Integer; Val : Unsigned_32) is
   begin
      Buf (Offset)     := Unsigned_8 (Val and 16#FF#);
      Buf (Offset + 1) := Unsigned_8 (Shift_Right(Val, 8) and 16#FF#);
      Buf (Offset + 2) := Unsigned_8 (Shift_Right(Val, 16) and 16#FF#);
      Buf (Offset + 3) := Unsigned_8 (Shift_Right(Val, 24) and 16#FF#);

   end Cyw43_Put_Le32;

   -- Mock implementation of cyw43_do_ioctl
   procedure Cyw43_Do_Ioctl
    (Buffer : in out Cyw43_Int_T; Kind, Cmd, Len : Integer;
     Buf   : U8_Array;  Iface : Unsigned_32) is
   begin
   null;
      -- In a real implementation, this would send the command to the hardware
      --  Ada.Text_IO.Put_Line ("IOCTL Called: Kind=" & Kind'Image & ", Cmd=" & Cmd'Image & ", Len=" & Len'Image);
   end Cyw43_Do_Ioctl;

   --  called as CYW43_write_iovar_u32_u32 ("gpioout", 1 << gpio_n, gpio_en ? (1 << gpio_n) : 0, WWD_STA_INTERFACE);
   procedure Cyw43_Write_Iovar_U32_U32 
      (Var : String; Val0, Val1 , Iface : uint32) is
      Var_Len     : constant Integer := Var'Length;
      Start_Index : constant Integer := SDPCM_HEADER_LEN + 16;
      buffer      : U8_Array (1 .. SDPCM_HEADER_LEN + 16);
      SPI_D_Buffer : U8_Array (1 .. Var_Len);
      -- uint8_t *buf = &self->spid_buf[SDPCM_HEADER_LEN + 16];
      -- size_t len = strlen(var) + 1;
      
      -- Unsigned_8se a slice or manual copy to represent the buffer pointer logic
      -- In Ada, we work with the indices of the Spid_Buf directly.
   begin
      -- memcpy(buf, var, len);
      for I in 1 .. Var_Len loop
         SPI_D_Buffer (Start_Index + I) := Unsigned_8 (Character'Pos (Var (Var'First + I)));
      end loop;
      SPI_D_Buffer (Start_Index + Var'Length) := 0; -- Null terminator

      -- cyw43_put_le32(buf + len, val0);
      Cyw43_Put_Le32 (SPI_D_Buffer, Start_Index + Var_Len, Val0);

      -- cyw43_put_le32(buf + len + 4, val1);
      Cyw43_Put_Le32 (SPI_D_Buffer, Start_Index + Var_Len + 4, Val1);

      -- cyw43_do_ioctl(self, SDPCM_SET, WLC_SET_VAR, len + 8, buf, iface);
      -- Note: We pass the slice of the buffer starting at Start_Index
      Cyw43_Do_Ioctl
          (SDPCM_SET, WLC_SET_VAR, Var_Len + 8, 
           SPI_D_Buffer (Start_Index .. Start_Index + Var_Len + 7), Iface);
   end Cyw43_Write_Iovar_U32_U32;

end CYW43_LL;