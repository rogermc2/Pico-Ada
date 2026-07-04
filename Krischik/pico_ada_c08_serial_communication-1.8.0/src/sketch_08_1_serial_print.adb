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

with Ada.Exceptions;
with Ada.Real_Time;
with Ada.Text_IO;
with Pico.Debug_IO;
with Pico.UART_IO;
with Pico.USB_IO;

---
--  Serial write sample from Chapter 8.1 from the Freenove C-Tutorial
--
procedure Sketch_08_1_Serial_Print with
   No_Return
is
   package RT renames Ada.Real_Time;

   pragma Debug (Pico.Debug_IO.Initialise);
   pragma Debug (Pico.Debug_IO.Put_Line ("+ Sketch_08_1_Serial_Print"));
begin
   pragma Debug (Pico.Debug_IO.Put_Line ("> Initialising Main"));

   --  Initialise the USB and UART interfaces. We use the the default write timeouts. Ada.Text_IO is initialiused
   --  automatically by the semi-hosting framework.
   Pico.USB_IO.Initialise;
   Pico.UART_IO.Initialise;

   --  Example of using all tree output methods, USB, UART and SWD (Serial Wire Debug) to print a message to a console.
   --  You need to setup three different consoles to see the output. The USB and UART output can be seen in a terminal
   --  program and the SWD output can be seen in a debugger.
   --
   --  In actual applications, it is recommended to use only one output method, as using all three methods will result
   --  in a lot of output and may cause performance issues.
   Pico.USB_IO.Put_Line ("USB: Raspberry Pi Pico initialization completed!");
   Pico.UART_IO.Put_Line ("UART: Raspberry Pi Pico initialization completed!");
   Ada.Text_IO.Put_Line ("SWD: Raspberry Pi Pico initialization completed!");

   pragma Debug (Pico.Debug_IO.Put_Line ("> Starting main loop"));
   loop
      Pico.USB_IO.Put_Line ("USB: Clock = " & RT.Clock'Image);
      Pico.UART_IO.Put_Line ("UART: Clock = " & RT.Clock'Image);
      Ada.Text_IO.Put_Line ("SWD: Clock = " & RT.Clock'Image);

      delay 1.0;
   end loop;
exception
   when E : others =>
      --  In release builds, debug output is disabled, so we use Ada.Text_IO to print the exception information to the
      --  console.
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Name (E));
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Message (E));
      pragma Debug (Pico.Debug_IO.Put_Line ("- Sketch_08_1_Serial_Print.Main"));
      raise;
end Sketch_08_1_Serial_Print;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
