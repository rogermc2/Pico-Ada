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
with Pico;
with RP.GPIO;

--  Blink LED sample from Chapter 1.1 from the Freenove C-Tutorial Chapter 1.1
--  RP2040 light tasking version

procedure Sketch_01_2_Blink with No_Retur is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_01_2_Blink"));

   --  Use GP 15 for the external LED
   LED : RP.GPIO.GPIO_Point;
begin
   LED.Pin := 15;
   pragma Debug (Pico.UART_IO.Put_Line ("> Initialise"));

   LED.Configure (RP.GPIO.Output);

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      LED.Set;
      delay 0.5;
      LED.Clear;
      delay 0.5;
   end loop;

end Sketch_01_2_Blink;
