
with Pico_W_Registers; use Pico_W_Registers;

package Pico2W_Hardware is
   --  type Word is mod 2**32 with Size => 32;

   -- Pad control register layout for controlling electrical characteristics
   type Pad_Ctrl is record
      OD          : Boolean; -- Output Disable
      IE          : Boolean; -- Input Enable
      DRIVE       : Bits_2;  -- 2mA, 4mA, 8mA, 12mA
      PUE         : Boolean; -- Pull-Up Enable
      PDE         : Boolean; -- Pull-Down Enable
      SCHMITT     : Boolean; -- Schmitt Trigger
      SLEWFAST    : Boolean; -- Slew Rate Fast
      Reserved    : Bits_24;
   end record with Size => 32;

   for Pad_Ctrl use record
      OD       at 0 range 7 .. 7;
      IE       at 0 range 6 .. 6;
      DRIVE    at 0 range 4 .. 5;
      PUE      at 0 range 3 .. 3;
      PDE      at 0 range 2 .. 2;
      SCHMITT  at 0 range 1 .. 1;
      SLEWFAST at 0 range 0 .. 0;
      Reserved at 0 range 8 .. 31;
   end record;

   -- System GPIO Control layout
   type GPIO_Ctrl is record
      FUNCSEL  : Bits_5;  -- Function selection (SPI, SIO etc.)
      OUTOVER  : Bits_2;  -- Peripheral output override
      OEOVER   : Bits_2;  -- Output enable override
      INOVER   : Bits_2;  -- Input override
      --  Reserved : Bits_21;
   end record with Size => 32;

   for GPIO_Ctrl use record
      FUNCSEL  at 0 range 0 .. 4;
      OUTOVER  at 0 range 8 .. 9;
      OEOVER   at 0 range 12 .. 13;
      INOVER   at 0 range 16 .. 17;
      --  Reserved at 0 range 5 .. 7; -- Note split range mapping
   end record;

   -- Hardware Register Base Mapping
   IO_BANK0_BASE   : constant := 16#40028000#;  --  16#40014000#;
   PADS_BANK0_BASE : constant := 16#40038000#;
   SIO_BASE        : constant := 16#d0000000#; -- Single-cycle IO block

   -- Example pointers for driving the pins
   --  SIO_GPIO_OUT_SET : Word with Address => To_Address(SIO_BASE + 16#014#);
   --  SIO_GPIO_OUT_CLR : Word with Address => To_Address(SIO_BASE + 16#018#);
   --  SIO_GPIO_OE_SET  : Word with Address => To_Address(SIO_BASE + 16#024#);

end Pico2W_Hardware;
