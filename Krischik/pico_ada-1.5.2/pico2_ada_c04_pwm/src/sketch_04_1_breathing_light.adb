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

---
--  Breathing LED sample from Chapter 4.1 from the Freenove C-Tutorial
--
procedure Sketch_04_1_Breathing_Light with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_04_1_Breathing_Light"));

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   package PA renames Pico.Analog;

   ---
   --  Use GP 15 for the external LED
   --
   LED         : constant PA.PWM_Point            := PA.To_PWM (Pico.GP15);
   Hold_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.05);
   Next        : Ada.Real_Time.Time               := Ada.Real_Time.Clock;
begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      pragma Debug (Pico.UART_IO.Put_Line ("> Brighting up ..."));
      for I in 0 .. 100 loop
         PA.Write_Analog (LED, PA.Percentage (I));
         Next := @ + Hold_Period;
         delay until Next;
      end loop;

      pragma Debug (Pico.UART_IO.Put_Line ("> Dimming down ..."));
      for I in reverse 0 .. 100 loop
         PA.Write_Analog (LED, PA.Percentage (I));
         Next := @ + Hold_Period;
         delay until Next;
      end loop;
   end loop;
end Sketch_04_1_Breathing_Light;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
