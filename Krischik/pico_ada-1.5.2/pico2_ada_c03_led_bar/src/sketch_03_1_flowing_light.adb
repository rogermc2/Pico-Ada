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

--  -
--  Flowing LED sample from Chapter 3.1 from the Freenove C-Tutorial.
--
procedure Sketch_03_1_Flowing_Light with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_03_1_Flowing_Light"));

   --  -
   --  Array of pins instead of array of pin numbers as in the original
   --
   LEDs : array (1 .. 10)
      of RP.GPIO.GPIO_Point :=
      [(Pin => 16),
      (Pin => 17),
      (Pin => 18),
      (Pin => 19),
      (Pin => 20),
      (Pin => 21),
      (Pin => 22),
      (Pin => 26),
      (Pin => 27),
      (Pin => 28)];

begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Initialise"));
   for I in LEDs'Range loop
      LEDs (I).Configure (RP.GPIO.Output);
   end loop;

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      pragma Debug (Pico.UART_IO.Put_Line ("> Right to left"));
      for I in LEDs'Range loop
         LEDs (I).Set;
         delay 0.1;
         LEDs (I).Clear;
      end loop;

      pragma Debug (Pico.UART_IO.Put_Line ("> Left to Right"));
      for I in reverse LEDs'Range loop
         LEDs (I).Set;
         delay 0.1;
         LEDs (I).Clear;
      end loop;
   end loop;
end Sketch_03_1_Flowing_Light;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
