
with Interfaces; use Interfaces;

with RP2350; use RP2350;
with RP2350.SIO; use RP2350.SIO;

package CYW43_Bitbang is

   -- Bitmasks mapped from your hardware definitions
   Mask_REG_ON : constant UInt32 := 16#0080_0000#; -- GPIO 23
   Mask_DATA   : constant UInt32 := 16#0100_0000#; -- GPIO 24
   Mask_CS     : constant UInt32 := 16#0200_0000#; -- GPIO 25
   Mask_CLK    : constant UInt32 := 16#2000_0000#; -- GPIO 29

   procedure Send_Byte (Value : in Unsigned_8);
   function Read_Byte return Unsigned_8;

end CYW43_Bitbang;
