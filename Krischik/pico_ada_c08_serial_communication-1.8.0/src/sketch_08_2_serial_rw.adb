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
with Ada.Text_IO;
with Pico.Debug_IO;
with Pico.UART_IO;
with Pico.USB_IO;

---
--  Serial Read and Write sample from Chapter 8.2 from the Freenove C-Tutorial
--
procedure Sketch_08_2_Serial_RW with
   No_Return
is
   --  using Pico.Debug_IO allows you to configure the destination for debug output via Alire parameter to either SWD
   --  (Serial Wire Debug), UART or USB. The default is no output and suggested is UART.
   pragma Debug (Pico.Debug_IO.Initialise);
   pragma Debug (Pico.Debug_IO.Put_Line ("+ Sketch_08_1_Serial_RW"));

   Text : String (1 .. 128);
   Last : Natural;
begin
   pragma Debug (Pico.Debug_IO.Put_Line ("> Initialising Main"));

   --  Initialise the USB and UART interfaces with increased read timeouts to allow for user input.
   --
   --  USB_IO also needs a retry rate. For this example I use 10_000 retries in 60 seconds or every 0.006 seconds.
   --  This gives very smoth input but uses more CPU time. The default retry rate is 1000 retries in 10 seconds (0.01
   --  seconds), which is a good compromise between performance and responsiveness.
   --
   --  Ada.Text_IO is initialised automatically by the semi-hosting framework.
   Pico.USB_IO.Set_Read_Timeout (60.0, 10_000);
   Pico.USB_IO.Initialise;

   Pico.UART_IO.Set_Read_Timeout (60.0);
   Pico.UART_IO.Initialise;

   Pico.USB_IO.Put_Line ("Please input some characters,");
   Pico.USB_IO.Put_Line ("select ""Newline"" below and click send button.");

   Pico.UART_IO.Put_Line ("Please input some characters,");
   Pico.UART_IO.Put_Line ("select ""Newline"" below and click send button.");

   loop
      --  Read_Line will echo each character back to the sender, and support backspace to edit.
      Pico.USB_IO.Put ("Read line > ");
      Pico.USB_IO.Read_Line (Text, Last);
      Pico.USB_IO.Put_Line ("Text Read : " & Text (1 .. Last));

      --  Read_Line will echo each character back to the sender, and support backspace to edit.
      Pico.UART_IO.Put ("Read line > ");
      Pico.UART_IO.Read_Line (Text, Last);
      Pico.UART_IO.Put_Line ("Text Read : " & Text (1 .. Last));

      --  Ada.Text_IO only supports reading a single character, and does not echo back to the sender. Pico.Debug_IO
      --  contains an example on how to implement a Read_Line function for Ada.Text_IO that supports backspace and
      --  echoing.
      Ada.Text_IO.Put ("Get character > ");
      Ada.Text_IO.Get (Text (1));
      Ada.Text_IO.Put_Line ("Text Read : " & Text (1));
   end loop;
exception
   when E : others =>
      --  In release builds, debug output is disabled, so we use Ada.Text_IO to print the exception information to the
      --  console.
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Name (E));
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Message (E));
      pragma Debug (Pico.Debug_IO.Put_Line ("- Sketch_08_1_Serial_RW"));
      raise;
end Sketch_08_2_Serial_RW;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
