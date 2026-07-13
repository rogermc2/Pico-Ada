
with System.Address_To_Access_Conversions; -- Add this dependency

with Interfaces; use Interfaces;

package RP2350_CYW43439 is
   pragma Preelaborate;

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
   Pin_DATA : constant := 24;
   Pin_CS   : constant := 25;
   Pin_CLK  : constant := 29;

   -- Bitmasks
   Mask_DATA : constant Volatile_Word := 2**Pin_DATA;
   Mask_CS   : constant Volatile_Word := 2**Pin_CS;
   Mask_CLK  : constant Volatile_Word := 2**Pin_CLK;

   procedure Initialize_gSPI;
   function Read_gSPI_Byte return Interfaces.Unsigned_8;
   procedure Set_Onboard_LED (Enable : Boolean);
   procedure Write_gSPI_Byte (Data : Interfaces.Unsigned_8);

end RP2350_CYW43439;
