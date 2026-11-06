--------------------------------------------------------------- {{{1 ----------
--: Copyright © 2026 … 2026 Martin Krischik «krischik@users.sourceforge.net»
------------------------------------------------------------------------------
--: This library is free software; you can redistribute it and/or modify it
--: under the terms of the GNU Library General Public License as published by
--: the Free Software Foundation; either version 2 of the License, or (at your
--: option) any later version.
--:
--: This library is distributed in the hope that it will be useful, but
--: WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
--: or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Library General Public
--: License for more details.
--:
--: You should have received a copy of the GNU Library General Public License
--: along with this library; if not, write to the Free Software Foundation,
--: Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
--------------------------------------------------------------- }}}1 ----------
pragma License (Modified_Gpl);
pragma Ada_2022;
pragma Extensions_Allowed (On);

with Pico.UART_IO;
with RP.Clock;
with RP.Device;
with RP.GPIO;
with RP.PWM;

procedure Pico.Tone.Test is
   use type RP.PWM.Period;

   Pin_Buzzer : RP.GPIO.GPIO_Point renames Pico.GP15;
   Reload     : RP.PWM.Period;
   Divider    : RP.PWM.Divider;
   Ton_A      : RP.Hertz                  := 440;
   PWM_Buzzer : constant RP.PWM.PWM_Point := RP.PWM.To_PWM (Pico.GP15);
   --  Line : String (1 .. 20);

   procedure Frequency_To_PWM
      (Target_Hz :     RP.Hertz;
       Div       : out RP.PWM.Divider;
       Period    : out RP.PWM.Period)
   is
      Sys_Freq  : constant RP.Hertz := RP.Clock.Frequency (RP.Clock.SYS);
      --  We want Period to be as close to 65535 as possible for resolution. Max_Period + 1 = 65536
      Total_Div : Float             := Float (Sys_Freq) / (Float (Target_Hz) * 65_536.0);
   begin
      --  1. Calculate the Hardware Divider (8.4 bit fixed point)
      Total_Div := (if Total_Div < 1.0 then
      --  Minimum divider is 1.0 (no division)
      1.0 elsif Total_Div > 255.937_5 then
      --  Ensure we don't exceed the hardware limit (255 ¹⁵/₁₆, which is 255.9375 in decimal)
      255.937_5 else Total_Div);

      --  2. Convert to the library's Divider type
      Div := RP.PWM.Divider (Total_Div);

      --  3. Calculate the Period (Wrap value): Period = (Sys_Freq / (Div * Target_Hz)) - 1
      Period := RP.PWM.Period ((Float (Sys_Freq) / (Total_Div * Float (Target_Hz))) - 1.0);
   end Frequency_To_PWM;

begin
   --  Since this is a pure test program we do not use pragma Debug for output. Instead we print directly to the UART
   --  so the messages are visible even when debugging is disabled.
   Pico.UART_IO.Initialise;
   Pico.UART_IO.Put_Line ("+ Pico.Tone.Test.Main");
   Pico.UART_IO.Put_Line ("=== 440 Hz PMW Square Wave Test ===");
   Pico.UART_IO.Put_Line ("Scope on GP15 (physical pin 20) to see the square wave output");

   Pico.UART_IO.Put_Line ("> Initialising");
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   RP.Device.Timer.Enable;
   RP.PWM.Initialize;

   Frequency_To_PWM (Ton_A, Divider, Reload);
   Pin_Buzzer.Configure (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);
   PWM_Buzzer.Slice.Set_Divider (Divider);
   PWM_Buzzer.Slice.Set_Interval (Reload);
   PWM_Buzzer.Slice.Set_Duty_Cycle (PWM_Buzzer.Channel, Duty_Cycle => Reload / 2);
   PWM_Buzzer.Slice.Enable;

   Pico.UART_IO.Put_Line ("> Starting main loop");
   loop
      RP.Device.Timer.Delay_Milliseconds (1_000);

      --  Read new frequency from UART and update the PWM settings to change the output frequency of the square wave.
      --  This is only a test program, so we do not do any error handling on the input. Just enter a number and press
      --  Enter to change the frequency of the square wave. Pico.UART_IO.Get_Line (Line);

      Ton_A := Ton_A + 100;

      Frequency_To_PWM (Ton_A, Divider, Reload);
      PWM_Buzzer.Slice.Disable;
      PWM_Buzzer.Slice.Set_Divider (Divider);
      PWM_Buzzer.Slice.Set_Interval (Reload);
      PWM_Buzzer.Slice.Set_Duty_Cycle (PWM_Buzzer.Channel, Duty_Cycle => Reload / 2);
      PWM_Buzzer.Slice.Enable;
   end loop;
end Pico.Tone.Test;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
