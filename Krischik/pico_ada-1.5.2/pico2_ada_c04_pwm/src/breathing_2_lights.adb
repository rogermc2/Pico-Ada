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

with Ada.Real_Time;
with Pico.Analog;
with Pico.UART_IO;
with Pico;
with RP.GPIO;
with RP.PWM;

---
--  Breathing LED sample from Chapter 4.1 from the Freenove C-Tutorial
--
procedure Breathing_2_Lights with
   No_Return
is
   use Pico.Analog;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;
   use type Analog_Level;

   ---
   --  Use GP14 and GP15 for the two external LEDs
   --
   LED_1_GPIO  : constant RP.GPIO.GPIO_Point      := Pico.GP14;
   LED_2_GPIO  : constant RP.GPIO.GPIO_Point      := Pico.GP15;
   LED_1_PWM   : constant RP.PWM.PWM_Point        := RP.PWM.To_PWM (LED_1_GPIO);
   LED_2_PWM   : constant RP.PWM.PWM_Point        := RP.PWM.To_PWM (LED_2_GPIO);
   Hold_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.05);
   Next        : Ada.Real_Time.Time               := Ada.Real_Time.Clock;
begin
   Pico.UART_IO.Initialise;
   Pico.UART_IO.Put_Line ("+ Breathing_2_Lights");

   Pico.UART_IO.Put_Line ("> LED_1 Pin     => " & LED_1_GPIO.Pin'Image);
   Pico.UART_IO.Put_Line ("> LED_1 Slice   => " & LED_1_PWM.Slice'Image);
   Pico.UART_IO.Put_Line ("> LED_1 Channel => " & LED_1_PWM.Channel'Image);
   Pico.UART_IO.Put_Line ("> LED_2 Pin     => " & LED_2_GPIO.Pin'Image);
   Pico.UART_IO.Put_Line ("> LED_2 Slice   => " & LED_2_PWM.Slice'Image);
   Pico.UART_IO.Put_Line ("> LED_2 Channel => " & LED_2_PWM.Channel'Image);

   RP.PWM.Set_Divider (LED_1_PWM.Slice, Default_Divider);
   RP.PWM.Set_Interval (LED_1_PWM.Slice, Default_Reload);
   RP.PWM.Set_Interval (LED_2_PWM.Slice, Default_Reload);
   RP.PWM.Enable (LED_1_PWM.Slice);
   Pico.GP14.Configure (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);
   Pico.GP15.Configure (RP.GPIO.Output, RP.GPIO.Floating, RP.GPIO.PWM);

   Pico.UART_IO.Put_Line ("> Entering main loop");
   loop
      Pico.UART_IO.Put_Line ("> Up");
      for I in Analog_Level'Range loop
         RP.PWM.Set_Duty_Cycle (LED_1_PWM.Slice, LED_1_PWM.Channel, Default_Reload * I);
         RP.PWM.Set_Duty_Cycle (LED_2_PWM.Slice, LED_2_PWM.Channel, Default_Reload * (255 - I));

         Next := @ + Hold_Period;
         delay until Next;
      end loop;

      Pico.UART_IO.Put_Line ("> Down");
      for I in reverse Analog_Level'Range loop
         RP.PWM.Set_Duty_Cycle (LED_1_PWM.Slice, LED_1_PWM.Channel, Default_Reload * I);
         RP.PWM.Set_Duty_Cycle (LED_2_PWM.Slice, LED_2_PWM.Channel, Default_Reload * (255 - I));

         Next := @ + Hold_Period;
         delay until Next;
      end loop;
   end loop;
end Breathing_2_Lights;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
