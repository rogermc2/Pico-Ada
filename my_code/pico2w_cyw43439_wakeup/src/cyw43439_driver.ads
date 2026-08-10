
with Interfaces; use Interfaces;

with RP2350; use RP2350;

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

   -- Bitmasks
   Mask_REG_ON   : constant UInt32 := 16#0080_0000#;
   Mask_DATA     : constant UInt32 := 16#0100_0000#;
   Mask_CS       : constant UInt32 := 16#0200_0000#;
   Mask_CLK      : constant UInt32 := 16#2000_0000#;
   All_Pins_Mask : constant UInt32 := 16#2380_0000#;

   procedure Build_SPI_Frame (Header : GSPI_Header;  Payload : Unsigned_8;
                              Buffer  : out U8_Array);

   procedure Execute_W_Wakeup;
   procedure Perform_WLAN_Wakeup;
   procedure SPI0_Transmit_Buffer (Buffer : U8_Array);

end CYW43439_Driver;
