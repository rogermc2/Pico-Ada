
with Ada.Real_Time; use Ada.Real_Time;

with Utilities; use Utilities;

package body CYW43_Bitbang is

   procedure Send_Byte (Value : in Unsigned_8) is
      Temp_Byte : Unsigned_8 := Value;
      genealogy : Unsigned_32;
   begin
      -- 1. Ensure Data Pin is configured as an Output
      SIO_Periph.GPIO_OE_SET := Mask_DATA;

      -- 2. Shift out 8 bits, Most Significant Bit (MSB) first
      for Bit in 1 .. 8 loop
         -- Drive the Data Pin High or Low based on the highest bit
         if (Temp_Byte and 16#80#) /= 0 then
            SIO_Periph.GPIO_OUT_SET := Mask_DATA;
         else
            SIO_Periph.GPIO_OUT_CLR := Mask_DATA;
         end if;

         -- Tiny instruction delay to respect maximum timing requirements
         Wait (Milliseconds (2)); 

         -- SPI Mode 0: Toggle Clock High (CYW43439 samples data here)
         SIO_Periph.GPIO_OUT_SET := Mask_CLK;
         Wait (Milliseconds (2));

         -- Shift to handle next bit
         Temp_Byte := Shift_Left (Temp_Byte, 1);

         -- Bring Clock back Low
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK;
      end loop;
   end Send_Byte;

   function Read_Byte return Unsigned_8 is
      Result : Unsigned_8 := 0;
   begin
      -- 1. Switch Data Pin to Input Mode (Isolate host drive)
      SIO_Periph.GPIO_OE_CLR := Mask_DATA;
      Wait (Milliseconds (2));

      -- 2. Sample 8 bits, MSB first
      for Bit in 1 .. 8 loop
         -- Shift left to make room for the incoming bit
         Result := Shift_Left (Result, 1);

         -- SPI Mode 0: Drive Clock High (CYW43439 presents valid data)
         SIO_Periph.GPIO_OUT_SET := Mask_CLK;
         Wait (Milliseconds (2));

         -- Read the current bit value directly from the SIO Input register
         if (SIO_Periph.GPIO_IN and Mask_DATA) /= 0 then
            Result := Result or 16#01#;
         end if;

         -- Drop Clock back Low
         SIO_Periph.GPIO_OUT_CLR := Mask_CLK;
         Wait (Milliseconds (2));
      end loop;

      return Result;

   end Read_Byte;

end CYW43_Bitbang;
