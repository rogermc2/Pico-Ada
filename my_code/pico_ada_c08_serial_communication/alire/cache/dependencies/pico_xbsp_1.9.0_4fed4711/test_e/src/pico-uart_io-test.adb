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
with Ada.Strings.Fixed;
with Ada.Text_IO;

procedure Pico.UART_IO.Test with
   No_Return
is
   use Ada.Strings.Fixed;

   Wait_One_Minute : constant Duration := 60.0;
   Line            : String (1 .. 200);
   Short_Line      : String (1 .. 10);
   Last            : Natural;
   Key             : Character;
begin
   Pico.UART_IO.Set_Read_Timeout (Wait_One_Minute);
   Pico.UART_IO.Initialise;
   Pico.UART_IO.Put_Line ("+ Pico.UART_IO.Test");

   Pico.UART_IO.Put_Line ("> Initialising");
   Pico.UART_IO.Put_Line ("Important: Timeout for input is " & Wait_One_Minute'Image & " seconds.");
   Pico.UART_IO.Put_Line ("This is the test with the embedded runtime which has exception support");
   Pico.UART_IO.Put_Line ("When an exception happens the exception information are printed and the test ends");

   Pico.UART_IO.Put_Line ("> Starting main loop");
   loop
      Pico.UART_IO.Put_Line ("Choose Test:");
      Pico.UART_IO.Put_Line ("a. Print Line");
      Pico.UART_IO.Put_Line ("b. Get character and echo");
      Pico.UART_IO.Put_Line ("c. Get 10 character string ");
      Pico.UART_IO.Put_Line ("d. Get line with maximum 200 character string");
      Pico.UART_IO.Put_Line ("e. Read line with maximum 200 character string");
      Pico.UART_IO.Put_Line ("f. Print long lines");
      Pico.UART_IO.Get (Key);
      Pico.UART_IO.Put_Line ("You entered: '" & Key & "'");

      case Key is
         when 'a' =>
            Pico.UART_IO.Put_Line ("Hello from UART_IO!");
         when 'b' =>
            Pico.UART_IO.Put ("Get> ");
            Pico.UART_IO.Get (Key);
            Pico.UART_IO.New_Line;
            Pico.UART_IO.Put_Line ("You entered: '" & Key & "'");
         when 'c' =>
            Pico.UART_IO.Put ("Get string> ");
            Pico.UART_IO.Get (Short_Line);
            Pico.UART_IO.New_Line;
            Pico.UART_IO.Put_Line ("You entered: """ & Ada.Strings.Fixed.Trim (Short_Line, Ada.Strings.Right) & """");
         when 'd' =>
            Pico.UART_IO.Put ("Get line> ");
            Pico.UART_IO.Get_Line (Line, Last);
            Pico.UART_IO.New_Line;

            if Last >= Line'First then
               Pico.UART_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               Pico.UART_IO.Put_Line ("No input received.");
            end if;
         when 'e' =>
            Pico.UART_IO.Put ("Read_Line> ");
            Pico.UART_IO.Read_Line (Line, Last);

            if Last >= Line'First then
               Pico.UART_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               Pico.UART_IO.Put_Line ("No input received.");
            end if;
         when 'f' =>
            Pico.UART_IO.Put_Line (" 20 character line " & 1 * '#');
            Pico.UART_IO.Put_Line (" 60 character line (including CR/LF) " & 19 * '#');
            Pico.UART_IO.Put_Line ("100 character line (including CR/LF) " & 59 * '#');
            Pico.UART_IO.Put_Line ("200 character line (including CR/LF) " & 159 * '#');
         when others =>
            Pico.UART_IO.Put_Line ("Invalid choice. Please enter a .. d");
      end case;
   end loop;
exception
   when E : others =>
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Name (E));
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Message (E));
      pragma Debug (Pico.UART_IO.Put_Line ("- Pico.UART_IO.Test"));
      raise;
end Pico.UART_IO.Test;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
