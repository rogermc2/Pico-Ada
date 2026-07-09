package Pico_W_Registers is
   pragma Preelaborate;

   type Word is mod 2**32 with Size => 32;

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
   SIO_GPIO_OUT_SET : volatile Word with Address => System'To_Address (SIO_Base + 16#0014#);
   SIO_GPIO_OUT_CLR : volatile Word with Address => System'To_Address (SIO_Base + 16#0018#);
   SIO_GPIO_OE_SET  : volatile Word with Address => System'To_Address (SIO_Base + 16#0024#);

end Pico_W_Registers;
