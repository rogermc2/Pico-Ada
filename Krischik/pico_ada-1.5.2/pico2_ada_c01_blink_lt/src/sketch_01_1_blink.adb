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

--: with RP.GPIO;
--: with Pico;
with Pico.UART_IO;

---
--  Blink LED sample from Chapter 1.1 from the Freenove C-Tutorial Chapter 1.1
--
procedure Sketch_01_1_Blink with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_01_1_Blink"));
begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Initialise"));

   --  Pico.LED.Configure (RP.GPIO.Output);

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      --  Pico.LED.Set;
      delay 0.1;
      --  Pico.LED.Clear;
      delay 0.1;
   end loop;
end Sketch_01_1_Blink;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
