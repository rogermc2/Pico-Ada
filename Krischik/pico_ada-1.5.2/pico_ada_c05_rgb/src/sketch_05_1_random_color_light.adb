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

with Ada.Exceptions;
with Ada.Numerics.Discrete_Random;
with Ada.Real_Time;
with Pico.Analog.RGB_LED;
with Pico.Analog;
with Pico.UART_IO;
with Pico;

---
--  LED sample from Chapter 5.1 from the Freenove C-Tutorial Chapter 4.1
--
procedure Sketch_05_1_Random_Color_Light with
   No_Return
is
   package RGB_LED renames Pico.Analog.RGB_LED;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   package Random_Colours is new Ada.Numerics.Discrete_Random (Pico.Analog.Analog_Level);

   LED : constant RGB_LED.Color_Array :=
      [Pico.Analog.To_PWM (Pico.GP11),
      Pico.Analog.To_PWM (Pico.GP12),
      Pico.Analog.To_PWM (Pico.GP13)];

   Random_Colour : Random_Colours.Generator;
   Hold_Period   : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.25);
   Next          : Ada.Real_Time.Time               := Ada.Real_Time.Clock;
begin
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_05_1_Random_Color_Light"));

   Random_Colour.Reset;

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      RGB_LED.Set_Color
         (LED         => LED,
          Red_Value   => Random_Colour.Random,
          Green_Value => Random_Colour.Random,
          Blue_Value  => Random_Colour.Random);

      Next := @ + Hold_Period;
      delay until Next;
   end loop;

exception
   when E : others =>
      pragma Debug (Pico.UART_IO.Put_Line ("=== UNHANDLED EXCEPTION ==="));
      pragma Debug (Pico.UART_IO.Put_Line (Ada.Exceptions.Exception_Name (E)));
      pragma Debug (Pico.UART_IO.Put_Line (Ada.Exceptions.Exception_Message (E)));
      pragma Debug (Pico.UART_IO.Put_Line ("- Sketch_05_1_Random_Color_Light"));
      raise;
end Sketch_05_1_Random_Color_Light;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
