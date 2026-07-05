with RP2350;
with RP2350.RESETS;
with RP2350.IO_BANK0;
with RP2350.PADS_BANK0;
with RP2350.SIO;

package body RP2350_GPIO is

   procedure Init_Output (Pin : RP2350.UInt32) is
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

      case Pin is
         when Pin_15 =>
            RP2350.IO_BANK0.IO_BANK0_Periph.GPIO15_CTRL.FUNCSEL :=
             RP2350.IO_BANK0.siob_proc_15;
         when Pin_25 =>
            RP2350.IO_BANK0.IO_BANK0_Periph.GPIO25_CTRL.FUNCSEL :=
               RP2350.IO_BANK0.siob_proc_25;
         when others =>
            null;
      end case;
      --  RP2350.IO_BANK0.IO_BANK0_Periph.GPIO15_CTRL.FUNCSEL :=
      --    RP2350.IO_BANK0.siob_proc_15;

      --  Working pad configuration found via debugger:
      --  IE = 1, OD = 0, pulls off
      --  RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO15 := 16#40#;
      --   RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO15 :=
      --     (ISO => 0, OD  => 0, IE  => 1,
      --      --  DRIVE => <default if present>,
      --      PUE => 0, PDE => 0,
      --      --  SCHMITT => <default if present>,
      --      --  SLEWFAST => <default if present>,
      --      others => <>);

      --     RP2350.SIO.SIO_Periph.GPIO_OE_SET := Pin_15_Bit;

      case Pin is 
         when Pin_15 =>
            RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO15 :=
               (ISO => 0, OD  => 0, IE  => 1, PUE => 0, PDE => 0,
                others => <>);
         when Pin_25 =>
            RP2350.PADS_BANK0.PADS_BANK0_Periph.GPIO25 :=
               (ISO => 0, OD  => 0, IE  => 1, PUE => 0, PDE => 0,
                others => <>);
         when others =>
            null;
      end case;
      RP2350.SIO.SIO_Periph.GPIO_OE_SET := Pin;
      
   end Init_Output;

   procedure Set_High (Pin : Pin_Number) is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_SET := Pin;
   end Set_High;

   procedure Set_Low (Pin : Pin_Number) is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_CLR := Pin;
   end Set_Low;

   procedure Toggle (Pin : Pin_Number) is
   begin
      RP2350.SIO.SIO_Periph.GPIO_OUT_XOR := Pin;
   end Toggle;

end RP2350_GPIO;
