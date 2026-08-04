
with Ada.Real_Time; use Ada.Real_Time;

with RP2350; use RP2350;
with RP2350.SIO; use RP2350.SIO;
with RP2350_CYW43439;

with Utilities; use Utilities;

package body CYW43439_IO is

   -- Bitmasks
   Mask_REG_ON   : constant uint32 := 16#0080_0000#;
   Mask_DATA     : constant uint32 := 16#0100_0000#;
   Mask_CS       : constant uint32 := 16#0200_0000#;  
   Mask_CLK      : constant uint32 := 16#2000_0000#;
   All_Pins_Mask : constant uint32 := 16#23800000#;

function Read_gSPI_Byte return Unsigned_8 is
   Result : Unsigned_8 := 0;
begin
   -- Relinquish host drive so the CYW43439 can modulate the line
   SIO_Periph.GPIO_OUT_CLR := Mask_CS;
   for Bit in 1 .. 8 loop
      SIO_Periph.GPIO_OUT_CLR := Mask_CLK;
      Wait (Microseconds (2));
      Result := Shift_Left (Result, 1);
      --  Read the pin status out of the SIO peheral's live hardware state register
      --  GPIO_IN has the input value for GPIO0...31.
      if (SIO_Periph.GPIO_IN and Mask_DATA) /= 0 then
         Result := Result or 16#01#;
      end if;
      Wait (Microseconds (2));
      SIO_Periph.GPIO_OUT_SET := Mask_CLK;
   end loop;

   SIO_Periph.GPIO_OUT_SET := Mask_CS;

   return Result;

end Read_gSPI_Byte;

function Read_gSPI_Word32 return Unsigned_32 is
   use RP2350.SIO;
   Result : Unsigned_32 := 0;
begin
Result := Shift_Left (Unsigned_32 (Read_gSPI_Byte), 24) or
            Shift_Left (Unsigned_32 (Read_gSPI_Byte), 16) or
            Shift_Left (Unsigned_32 (Read_gSPI_Byte), 8)  or
            Unsigned_32 (Read_gSPI_Byte);

   return Result;

end Read_gSPI_Word32;

procedure Write_gSPI_Byte (Data : Unsigned_8) is
   Temp   : Unsigned_8 := Data;
begin
      SIO_Periph.GPIO_OUT_CLR := Mask_CS; -- Assert CS Low to select CYW43439
   --  Send MSB first
   for Bit in 1 .. 8 loop
      if (Temp and 16#80#) /= 0 then
         SIO_Periph.GPIO_OUT_SET := Mask_DATA;
      else
         SIO_Periph.GPIO_OUT_CLR := Mask_DATA;
      end if;

      SIO_Periph.GPIO_OUT_SET := Mask_CLK;
      Wait (Microseconds (2)); -- Stable bit hold period
      SIO_Periph.GPIO_OUT_CLR := Mask_CLK; 
      Temp := Shift_Left (Temp, 1);
      Wait (Microseconds (2));
   end loop;
         SIO_Periph.GPIO_OUT_SET := Mask_CS; -- Deassert CS High to deselect CYW43439

end Write_gSPI_Byte;

procedure Write_gSPI_Word32 (Value : Interfaces.Unsigned_32) is
   -- Stream the 32-bit word as 4 bytes (MSB first)
   Buffer : Unsigned_8 := Unsigned_8 (Shift_Right (Value, 24) and 16#FF#);
   begin
      Write_gSPI_Byte (Buffer);
      Buffer := Unsigned_8 (Shift_Right (Value, 16) and 16#FF#);
      Write_gSPI_Byte (Buffer);
      Buffer := Unsigned_8 (Shift_Right (Value, 8)  and 16#FF#);
      Write_gSPI_Byte (Buffer);
      Write_gSPI_Byte (Unsigned_8 (Value and 16#FF#));
      
   end Write_gSPI_Word32;

end CYW43439_IO;