
with System.Address_To_Access_Conversions; 

with RP2350; use RP2350;

package Registers is
   pragma Preelaborate;

 type Volatile_Word is mod 2**32;
   pragma Volatile (Volatile_Word);

   package Word_Convert is new
    System.Address_To_Access_Conversions (Volatile_Word);

   -- Register Map Addresses
   --  IO_BANK0_Base : constant := 16#40028000#;
   --  SIO_Base      : constant := 16#D0000000#;
   --  SIO_Base      : constant := 16#40014000#;

   -- Pin definitions matching Pico 2 W topology
   Pin_REG_ON : constant := 23;
   Pin_DATA   : constant := 24;
   Pin_CS     : constant := 25;
   Pin_CLK    : constant := 29;

   -- Bitmasks
   Mask_REG_ON   : constant uint32 := 16#0080_0000#;
   Mask_DATA     : constant uint32 := 16#0100_0000#;
   Mask_CS       : constant uint32 := 16#0200_0000#;
   Mask_CLK      : constant uint32 := 16#2000_0000#;
   All_Pins_Mask : constant uint32 := 16#2380_0000#;

end;