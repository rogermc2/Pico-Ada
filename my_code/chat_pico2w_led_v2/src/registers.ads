
with System.Address_To_Access_Conversions; 
with System.Vs_Int;

with Interfaces; use Interfaces;

package Registers is
   --  pragma Preelaborate;

 type Volatile_Word is mod 2**32;
   pragma Volatile (Volatile_Word);

   package Word_Convert is new
    System.Address_To_Access_Conversions (Volatile_Word);

   -- Register Map Addresses
   IO_BANK0_Base : constant := 16#40028000#;
   SIO_Base      : constant := 16#40014000#;

   -- SIO Register Offsets (Direct GPIO access)
   SIO_GPIO_OUT_SET_Offset : constant := 16#014#;
   SIO_GPIO_OUT_CLR_Offset : constant := 16#018#;
   SIO_GPIO_IN_Offset      : constant := 16#004#;
   SIO_GPIO_OE_SET_Offset  : constant := 16#024#;
   SIO_GPIO_OE_CLR_Offset  : constant := 16#028#;

   -- Pin definitions matching Pico 2 W topology

   Pin_REG_ON : constant := 23;
   Pin_DATA   : constant := 24;
   Pin_CS     : constant := 25;
   Pin_CLK    : constant := 29;

   -- Bitmasks
   Mask_REG_ON   : constant Unsigned_32 := 16#0080_0000#;
   Mask_DATA     : constant Unsigned_32 := 16#0100_0000#;
   Mask_CS       : constant Unsigned_32 := 16#0200_0000#;
   Mask_CLK      : constant Unsigned_32 := 16#2000_0000#;
   All_Pins_Mask : constant Unsigned_32 := 16#2380_0000#;

end;