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
with RP.GPIO;
with RP.PWM;

procedure Pico.Tone.Test with
   No_Return
is
   Pin_Buzzer       : RP.GPIO.GPIO_Point renames Pico.GP15;
   PWM_Buzzer       : constant RP.PWM.PWM_Point := RP.PWM.To_PWM (Pin_Buzzer);
   Ton_A1           : constant RP.Hertz         := 440;
   Ton_B1           : constant RP.Hertz         := 494;
   Ton_C1           : constant RP.Hertz         := 523;
   Ton_D1           : constant RP.Hertz         := 587;
   Ton_E1           : constant RP.Hertz         := 659;
   Ton_F1           : constant RP.Hertz         := 698;
   Ton_G1           : constant RP.Hertz         := 784;
   Ton_A2           : constant RP.Hertz         := 880;
   Ton_B2           : constant RP.Hertz         := 988;
   Ton_C2           : constant RP.Hertz         := 1_046;
   Ton_D2           : constant RP.Hertz         := 1_174;
   Ton_E2           : constant RP.Hertz         := 1_318;
   Ton_F2           : constant RP.Hertz         := 1_396;
   Ton_G2           : constant RP.Hertz         := 1_568;
   Current_Ton      : RP.Hertz;
   Key              : Character;
   Use_Equalisation : Boolean                   := False;
begin
   --  Since this is a pure test program we do not use pragma Debug for output. Instead we print directly to the UART
   --  so the messages are visible even when debugging is disabled.
   Pico.UART_IO.Set_Read_Timeout (60.0);
   Pico.UART_IO.Set_Write_Timeout (1.0);
   Pico.UART_IO.Initialise;
   Pico.UART_IO.Put_Line ("+ Pico.Tone.Test.Main");
   Pico.UART_IO.Put_Line ("Scope on GP15 (physical pin 20) to see the square wave output");
   Pico.UART_IO.Put_Line ("> Initialising");
   RP.PWM.Initialize;

   Pin_Buzzer.Configure (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);

   Pico.UART_IO.Put_Line ("> Starting main loop");
   loop
      Pico.UART_IO.Put_Line ("Choose Note A, B, C, D, E, F, G for first octave.");
      Pico.UART_IO.Put_Line ("Choose Note a, b, c, d, e, f, g for second octave.");
      Pico.UART_IO.Put_Line ("Choose q to toggle equalizer.");
      Pico.UART_IO.Get (Key);

      case Key is
         when 'a' =>
            Current_Ton := Ton_A1;
         when 'b' =>
            Current_Ton := Ton_B1;
         when 'c' =>
            Current_Ton := Ton_C1;
         when 'd' =>
            Current_Ton := Ton_D1;
         when 'e' =>
            Current_Ton := Ton_E1;
         when 'f' =>
            Current_Ton := Ton_F1;
         when 'g' =>
            Current_Ton := Ton_G1;
         when 'A' =>
            Current_Ton := Ton_A2;
         when 'B' =>
            Current_Ton := Ton_B2;
         when 'C' =>
            Current_Ton := Ton_C2;
         when 'D' =>
            Current_Ton := Ton_D2;
         when 'E' =>
            Current_Ton := Ton_E2;
         when 'F' =>
            Current_Ton := Ton_F2;
         when 'G' =>
            Current_Ton := Ton_G2;
         when 'q'
            | 'Q' =>
            Use_Equalisation := not Use_Equalisation;
            Pico.UART_IO.Put_Line ("Equalisation now " & (if Use_Equalisation then "on" else "off"));
            goto Continue;
         when others =>
            Pico.UART_IO.Put_Line ("Invalid choice '" & Key & "'.");
            goto Continue;
      end case;

      Pico.UART_IO.Put_Line ("Playing note => " & Key);

      if Use_Equalisation then
         Pico.Tone.Output (PWM_Buzzer, Current_Ton, Pico.Tone.Equalisation (Current_Ton));
      else
         Pico.Tone.Output (PWM_Buzzer, Current_Ton);
      end if;

      delay 1.0;

      Pico.Tone.Output (PWM_Buzzer, 0);
      <<Continue>>
   end loop;
end Pico.Tone.Test;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
