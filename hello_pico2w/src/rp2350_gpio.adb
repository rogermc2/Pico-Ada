with RP2350;
with RP2350.RESETS;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

package body RP2350_GPIO is

   Pin_15_Bit : constant RP2350.UInt32 := 16#0000_8000#;

   procedure Init_Output_15 is
   use rp2350;
   begin
      RP2350.RESETS.RESETS_Periph.RESET.IO_BANK0   := 0;
      RP2350.RESETS.RESETS_Periph.RESET.PADS_BANK0 := 0;

      while RP2350.RESETS.RESETS_Periph.RESET_DONE.IO_BANK0 = 0 loop
         null;
      end loop;

      while RP2350.RESETS.RESETS_Periph.RESET_DONE.PADS_BANK0 = 0 loop
         null;
      end loop;

      RP2350.IO_BANK0.IO_BANK0_Periph.GPIO15_CTRL.FUNCSEL :=
        RP2350.IO_BANK0.siob_proc_15;

      --  Working pad configuration found via debugger:
      --  IE = 1, OD = 0, pulls off
      --  RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO15 := 16#40#;
    RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO15 :=
      (ISO => 0,
       OD  => 0,
       IE  => 1,
       --  DRIVE => <default if present>,
       PUE => 0,
       PDE => 0,
       --  SCHMITT => <default if present>,
       --  SLEWFAST => <default if present>,
       others => <>);

      RP2350.SIO.SIO_Periph.GPIO_OE_SET := Pin_15_Bit;
   end Init_Output_15;

   procedure Set_High_15 is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_SET := Pin_15_Bit;
   end Set_High_15;

   procedure Set_Low_15 is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_CLR := Pin_15_Bit;
   end Set_Low_15;

   procedure Toggle_15 is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_XOR := Pin_15_Bit;
   end Toggle_15;

end RP2350_GPIO;
