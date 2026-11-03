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

---
--  Flowing LED sample from Chapter 3.1 from the Freenove C-Tutorial.
--
procedure Sketch_04_2_Flowing_Light_2 with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_04_2_Flowing_Light_2"));

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   package PA renames Pico.Analog;

   ---
   --  The LED bar has 10 LEDs
   --
   LED_Count : constant := 10;

   ---
   --   GPIO Pins the LEDs are connected to
   --
   LEDs : constant array (1 .. LED_Count)
      of PA.PWM_Point :=
      [PA.To_PWM (Pico.GP16),
      PA.To_PWM (Pico.GP17),
      PA.To_PWM (Pico.GP18),
      PA.To_PWM (Pico.GP19),
      PA.To_PWM (Pico.GP20),
      PA.To_PWM (Pico.GP21),
      PA.To_PWM (Pico.GP22),
      PA.To_PWM (Pico.GP26),
      PA.To_PWM (Pico.GP27),
      PA.To_PWM (Pico.GP28)];

   ---
   --  Predefined duty-cycle table for creating a smooth "breathing" or fading effect.
   --
   --  This array contains 30 PWM values that start at 0, rise smoothly to full brightness (using powers of two), and
   --  then fall back to 0 again. It is ideal for LED breathing animations, status indicators, or any effect where you
   --  want a gentle fade-in / fade-out without doing the maths at runtime.
   --
   --  The values were generated with the ``Map`` function (see below) and are already scaled to the full 12-bit PWM
   --  range (0 .. 4095) used by the Pico.
   --
   --:  Typical usage:
   --:    for I in Duty_Cycle_Table'Range loop
   --:       Write_Analog (LED_Point, Duty_Cycle_Table (I));
   --:       delay 0.05;
   --:    end loop;
   --!pp off
   Duty_Cycle_Table : constant array (1 .. 3 * LED_Count)
      of Integer := [
      0,     0,     0,     0,   0,   0,   0,  0,  0,  0,
      4_095, 2_047, 1_023, 512, 256, 128, 64, 32, 16, 8,
      0,     0,     0,     0,   0,   0,   0,  0,  0,  0];
   --!pp on

   Hold_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.05);
   Next        : Ada.Real_Time.Time               := Ada.Real_Time.Clock;

begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      pragma Debug (Pico.UART_IO.Put_Line ("> Right to left"));
      for I in 0 .. 2 * LED_Count - 1 loop
         for J in LEDs'Range loop
            PA.Write_Analog (LEDs (J), PA.Map_Percentage (Duty_Cycle_Table (J + I), 0, 4_096));
         end loop;
         Next := @ + Hold_Period;
         delay until Next;
      end loop;

      pragma Debug (Pico.UART_IO.Put_Line ("> Left to Right"));
      for I in 0 .. 2 * LED_Count - 1 loop
         for J in reverse LEDs'Range loop
            PA.Write_Analog (LEDs (J), PA.Map_Percentage (Duty_Cycle_Table (LED_Count - J + I + 1), 0, 4_096));
         end loop;
         Next := @ + Hold_Period;
         delay until Next;
      end loop;
   end loop;
end Sketch_04_2_Flowing_Light_2;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
