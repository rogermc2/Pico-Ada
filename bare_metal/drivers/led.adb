with Interfaces; use Interfaces;

with RP2350_Pads_Bank0; use RP2350_Pads_Bank0;
with RP2350_SIO; use RP2350_SIO;
with RP2350_Resets; use RP2350_Resets;
with RP2350_IO_Bank0; use RP2350_IO_Bank0;

package body Led is

   LED_RESETS : constant Unsigned_32 :=
     RESETS_RESET_IO_BANK0_MASK or RESETS_RESET_PADS_BANK0_MASK;

   procedure Configure_Led (LED_PIN : Natural) is
   begin
      RESETS_RESET_CLR := LED_RESETS;

      -- Wait until reset is done
      while (RESETS_RESET_DONE and LED_RESETS) /= LED_RESETS loop
         null;
      end loop;

      PADS_BANK0_GPIO15 :=
        PADS_BANK0_GPIO15_OD (0) or
        PADS_BANK0_GPIO15_IE (0) or
        PADS_BANK0_GPIO15_DRIVE (0) or
        PADS_BANK0_GPIO15_PUE (0) or
        PADS_BANK0_GPIO15_PDE (0) or
        PADS_BANK0_GPIO15_SCHMITT (0) or
        PADS_BANK0_GPIO15_SLEWFAST (0);

      IO_BANK0_GPIO15_CTRL :=
        IO_BANK0_GPIO15_CTRL_IRQOVER (0) or
        IO_BANK0_GPIO15_CTRL_INOVER (0) or
        IO_BANK0_GPIO15_CTRL_OEOVER (0) or
        IO_BANK0_GPIO15_CTRL_OUTOVER (0) or
        IO_BANK0_GPIO15_CTRL_FUNCSEL (5);

      SIO_GPIO_OE_SET := 2 ** LED_PIN;
   end Configure_Led;

   procedure Turn_On_Led (LED_PIN : Natural) is
   begin
      SIO_GPIO_OUT_SET := 2 ** LED_PIN;
   end Turn_On_Led;

   procedure Turn_Off_Led (LED_PIN : Natural) is
   begin
      SIO_GPIO_OUT_CLR := 2 ** LED_PIN;
   end Turn_Off_Led;

   procedure Toggle_Led (LED_PIN : Natural) is
   begin
      SIO_GPIO_OUT_XOR := 2 ** LED_PIN;
   end Toggle_Led;

end Led;
