
with Interfaces; use Interfaces;

package CYW43439_Driver is

   type Bus_Function is (Function_0_Bus, Function_1_Backplane, Function_2_WLAN);
   type U8_Array is array (Positive range <>) of Unsigned_8;

   -- A simple record without complex alignment clauses. 
   -- This lets Ada handle it normally in memory.
   type GSPI_Header is record
      Write_Access : Boolean;
      Auto_Inc     : Boolean;
      Func         : Bus_Function;
      Address      : Unsigned_32; -- The target register address
      Length       : Unsigned_32; -- Number of bytes to read/write
   end record;

   procedure Build_SPI_Frame (Header : GSPI_Header;  Payload : Unsigned_8;
                              Buffer  : out U8_Array);
   procedure SPI0_Transmit_Buffer (Buffer : U8_Array);

end CYW43439_Driver;
