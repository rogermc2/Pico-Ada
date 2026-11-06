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

with Ada.Strings.Fixed;
with Ada.Text_IO;
with Pico.UART_IO;
with Pico.Debug_IO;

procedure Pico.USB_IO.Test is
   use Ada.Strings.Fixed;

   Wait_One_Minute : constant Duration := 60.0;
   Line            : String (1 .. 200);
   Last            : Natural;
   Key             : Character;
begin
   Ada.Text_IO.Put_Line ("+ Pico.USB_IO.Test");

   Debug_IO.Activate_USB_Logging;

   UART_IO.Set_Read_Timeout (Wait_One_Minute);
   UART_IO.Initialise;

   USB_IO.Set_Write_Timeout (1.0, 100);
   USB_IO.Set_Read_Timeout (Wait_One_Minute, 10_000);
   USB_IO.Initialise;

   Debug_IO.Print_USB_Log;

   UART_IO.Put_Line ("> Initialising");
   UART_IO.Put_Line ("Important: Timeout for input is " & Wait_One_Minute'Image & " seconds.");
   UART_IO.Put_Line ("This is the test with the light tasking runtime which has limited exception support");
   UART_IO.Put_Line ("When an exception happens the test ends");

   Ada.Text_IO.Put_Line ("> Starting main loop");
   loop
      Debug_IO.Print_USB_Log;

      UART_IO.Put_Line ("Choose Test:");
      UART_IO.Put_Line ("a. Print Line");
      UART_IO.Put_Line ("b. Get character and echo");
      UART_IO.Put_Line ("c. Get 10 character string");
      UART_IO.Put_Line ("d. Get 200 character string (Paste 200 characters to test buffer handling)");
      UART_IO.Put_Line ("e. Get line with maximum 200 character string");
      UART_IO.Put_Line ("f. Read line with maximum 200 character string");
      UART_IO.Put_Line ("g. Print long lines line");
      UART_IO.Put_Line ("h. Print long lines line starting with longest line first");
      UART_IO.Get (Key);
      UART_IO.Put_Line ("> Test choosen: '" & Key & "'");

      Debug_IO.Print_USB_Log;

      case Key is
         when 'a' =>
            USB_IO.Put_Line ("Hello from USB_IO!");
         when 'b' =>
            USB_IO.Put ("Get> ");
            Debug_IO.Print_USB_Log;

            USB_IO.Get (Key);
            Debug_IO.Print_USB_Log;

            USB_IO.New_Line;
            USB_IO.Put_Line ("You entered: '" & Key & "'");
         when 'c' =>
            USB_IO.Put ("Get string> ");
            Debug_IO.Print_USB_Log;

            USB_IO.Get (Line (1 .. 10));
            Debug_IO.Print_USB_Log;

            USB_IO.New_Line;
            USB_IO.Put_Line ("You entered: """ & Line (1 .. 10) & """");
         when 'd' =>
            USB_IO.Put ("Get string> ");
            Debug_IO.Print_USB_Log;

            --  We deliberately paste 200 characters — well above the 128-byte USB buffer (2 × block size) — to
            --  stress the maximum transfer rate.
            --
            --  Setting the retries to 1_000_000 over a 60-second overall wait gives a retry interval of 60 µs. This
            --  polls the buffer extremely frequently, removing data fast enough that no characters are lost despite
            --  the tiny buffer.
            USB_IO.Set_Read_Timeout (Wait_One_Minute, 1_000_000);
            USB_IO.Get (Line);
            USB_IO.Set_Read_Timeout (Wait_One_Minute, 10_000);
            Debug_IO.Print_USB_Log;

            USB_IO.New_Line;
            USB_IO.Put_Line ("You entered: """ & Line & """");
         when 'e' =>
            USB_IO.Put ("Get line> ");
            Debug_IO.Print_USB_Log;

            USB_IO.Get_Line (Line, Last);
            Debug_IO.Print_USB_Log;

            USB_IO.New_Line;

            if Last >= Line'First then
               USB_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               USB_IO.Put_Line ("No input received.");
            end if;
         when 'f' =>
            USB_IO.Put ("Read line> ");
            Debug_IO.Print_USB_Log;

            USB_IO.Read_Line (Line, Last);
            Debug_IO.Print_USB_Log;

            if Last >= Line'First then
               USB_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               USB_IO.Put_Line ("No input received.");
            end if;
         when 'g' =>
            UART_IO.Put_Line ("=== Starting USB length test ===");
            UART_IO.Put_Line ("Line lengths including CR/LF.");

            for Len in 20 .. 80 loop
               USB_IO.Put_Line (Len'Image & " character " & (Len - 16) * '#');
               Debug_IO.Print_USB_Log;
            end loop;

            UART_IO.Put_Line ("=== USB length test finished ===");
         when 'h' =>
            UART_IO.Put_Line ("=== Starting USB length test ===");
            UART_IO.Put_Line ("Line lengths including CR/LF.");

            for Len in reverse 20 .. 80 loop
               USB_IO.Put_Line (Len'Image & " character " & (Len - 16) * '#');
               Debug_IO.Print_USB_Log;
            end loop;

            UART_IO.Put_Line ("=== USB length test finished ===");
         when others =>
            UART_IO.Put_Line ("Invalid choice. Please enter a .. d");
      end case;
   end loop;
exception
   when others =>
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Debug_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Debug_IO.Print_USB_Log;
      Ada.Text_IO.Put_Line ("- Pico.USB_IO.Test");
end Pico.USB_IO.Test;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
