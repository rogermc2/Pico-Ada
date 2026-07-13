
with Interfaces; use Interfaces;

package RP2350_CYW43439 is

   procedure Initialize_gSPI;
   function Read_gSPI_Byte return Unsigned_8;
   procedure Set_Onboard_LED (Enable : Boolean);
   procedure Write_gSPI_Byte (Data : Unsigned_8);
   procedure Write_gSPI_Word32 (Value : Unsigned_32);

end RP2350_CYW43439;
