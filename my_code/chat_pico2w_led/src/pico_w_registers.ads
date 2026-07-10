
with System;

package Pico_W_Registers is
   pragma Preelaborate;

   type Word is mod 2**32 with Size => 32;
   type Bit is mod 2 ** 1 with Size => 1;
   for Bit'Alignment use 1;

   type Bits_2  is mod 2 ** 2  with Size => 2;
   type Bits_3  is mod 2 ** 3  with Size => 3;
   type Bits_4  is mod 2 ** 4  with Size => 4;
   type Bits_5  is mod 2 ** 5  with Size => 5;
   type Bits_6  is mod 2 ** 6  with Size => 6;
   type Bits_7  is mod 2 ** 7  with Size => 7;
   type Bits_8  is mod 2 ** 8  with Size => 8;
   type Bits_11 is mod 2 ** 11 with Size => 11;
   type Bits_16 is mod 2 ** 16 with Size => 16;
   type Bits_17 is mod 2 ** 17 with Size => 17;
   type Bits_20 is mod 2 ** 20 with Size => 20;
   type Bits_21 is mod 2 ** 21 with Size => 21;
   type Bits_24 is mod 2 ** 24 with Size => 24;
   type Bits_31 is mod 2 ** 31 with Size => 31;

   -- Bitmask for GPIO control overrides
   type Drive_Strength is (Drive_2mA, Drive_4mA, Drive_8mA, Drive_12mA);
   for Drive_Strength use (Drive_2mA => 0, Drive_4mA => 1, Drive_8mA => 2, Drive_12mA => 3);

   -- Precise Pad configuration aspect used by GNAT bare-metal
   type Pad_Config_Register is record
      Fast_Slew : Boolean;
      Schmitt   : Boolean;
      Pull_Down : Boolean;
      Pull_Up   : Boolean;
      Drive     : Drive_Strength;
      Input_En  : Boolean;
      Output_Dis: Boolean;
   end record with Size => 32;

   for Pad_Config_Register use record
      Fast_Slew  at 0 range 0 .. 0;
      Schmitt    at 0 range 1 .. 1;
      Pull_Down  at 0 range 2 .. 2;
      Pull_Up    at 0 range 3 .. 3;
      Drive      at 0 range 4 .. 5;
      Input_En   at 0 range 6 .. 6;
      Output_Dis at 0 range 7 .. 7;
   end record;

   -- Memory Addresses for RP2350 SIO (Single-cycle IO block)
   SIO_Base         : constant := 16#D000_0000#;
    -- Pointers for driving the pins
   SIO_GPIO_OUT_SET : Word with Address =>
      System'To_Address (SIO_Base + 16#0014#);
   SIO_GPIO_OUT_CLR : Word with Address =>
      System'To_Address (SIO_Base + 16#0018#);
   SIO_GPIO_OE_SET : Word with Address =>
    System'To_Address (SIO_Base + 16#0024#);

end Pico_W_Registers;
