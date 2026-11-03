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

with Pico;
with RP.GPIO;

---
--  Table Lamp sample from Chapter 2.2 from the Freenove C-Tutorial Chapter 2.2
--
procedure Sketch_02_2_Table_Lamp with
   No_Return
is
   ---
   --  Use GP 15 for the external LED
   --
   LED    : RP.GPIO.GPIO_Point renames Pico.GP15;
   ---
   --  Use GP 13 for the external Button
   --
   Button : RP.GPIO.GPIO_Point renames Pico.GP13;
begin
   LED.Configure (RP.GPIO.Output);
   Button.Configure (RP.GPIO.Input);

   loop
      --  toggle on button low.
      if not Button.Get then
         --  software debounce
         delay 0.02;
         if not Button.Get then
            LED.Toggle;
         end if;

         --  wait for button to be released
         while not Button.Get loop
            delay 0.02;
         end loop;
      end if;

      --  never busy wait in a tight loop
      delay 0.02;
   end loop;
end Sketch_02_2_Table_Lamp;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
