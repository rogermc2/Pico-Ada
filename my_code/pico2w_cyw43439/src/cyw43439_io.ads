
with Interfaces; use Interfaces;

package CYW43439_IO is

   function Read_gSPI_Byte return Unsigned_8;
   function Read_gSPI_Word32 return Unsigned_32;
   procedure Write_gSPI_Byte (Data : Unsigned_8) ;
   procedure Write_gSPI_Word32 (Value : Interfaces.Unsigned_32);

end CYW43439_IO;