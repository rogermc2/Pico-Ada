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
with Pico.USB_IO;

procedure Pico.Debug_IO.Test is
   use Ada.Strings.Fixed;

   Wait_One_Minute : constant Duration := 60.0;
   Line            : String (1 .. 200);
   Short_Line      : String (1 .. 10);
   Last            : Natural;
   Key             : Character;
begin
   Ada.Text_IO.Put_Line ("+ Pico.Debug_IO.Test");

   Pico.USB_IO.Set_Read_Timeout (Wait_One_Minute);
   Pico.USB_IO.Initialise;

   Pico.Debug_IO.Set_Read_Timeout (Wait_One_Minute);
   Pico.Debug_IO.Initialise;

   Ada.Text_IO.Put_Line ("> Initialising");
   Pico.USB_IO.Put_Line ("Important: Timeout for input is " & Wait_One_Minute'Image & " seconds.");
   Pico.USB_IO.Put_Line ("This is the test with the light tasking runtime which has limited exception support");
   Pico.USB_IO.Put_Line ("When an exception happens the test ends");

   Ada.Text_IO.Put_Line ("> Starting main loop");
   loop
      Pico.USB_IO.Put_Line ("Choose Test:");
      Pico.USB_IO.Put_Line ("a. Print Line");
      Pico.USB_IO.Put_Line ("b. Get character and echo");
      Pico.USB_IO.Put_Line ("c. Get 10 character string ");
      Pico.USB_IO.Put_Line ("d. Get line with maximum 200 character string");
      Pico.USB_IO.Put_Line ("e. Read line with maximum 200 character string");
      Pico.USB_IO.Put_Line ("f. Print long lines");
      Pico.USB_IO.Get (Key);
      Pico.USB_IO.Put_Line ("You entered: '" & Key & "'");

      case Key is
         when 'a' =>
            Pico.Debug_IO.Put_Line ("Hello from Debug_IO!");
         when 'b' =>
            Pico.Debug_IO.Put ("Get> ");
            Pico.Debug_IO.Get (Key);
            Pico.Debug_IO.New_Line;
            Pico.Debug_IO.Put_Line ("You entered: '" & Key & "'");
         when 'c' =>
            Pico.Debug_IO.Put ("Get string> ");
            Pico.Debug_IO.Get (Short_Line);
            Pico.Debug_IO.New_Line;
            Pico.Debug_IO.Put_Line ("You entered: """ & Ada.Strings.Fixed.Trim (Short_Line, Ada.Strings.Right) & """");
         when 'd' =>
            Pico.Debug_IO.Put ("Get line> ");
            Pico.Debug_IO.Get_Line (Line, Last);
            Pico.Debug_IO.New_Line;

            if Last >= Line'First then
               Pico.Debug_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               Pico.Debug_IO.Put_Line ("No input received.");
            end if;
         when 'e' =>
            Pico.Debug_IO.Put ("Read line> ");
            Pico.Debug_IO.Read_Line (Line, Last);

            if Last >= Line'First then
               Pico.Debug_IO.Put_Line ("You entered: """ & Line (Line'First .. Last) & """");
            else
               Pico.Debug_IO.Put_Line ("No input received.");
            end if;
         when 'f' =>
            Pico.Debug_IO.Put_Line ("200 character line " & 179 * '#');
            Pico.Debug_IO.Put_Line ("256 character line " & 235 * '#');
         when others =>
            Pico.USB_IO.Put_Line ("Invalid choice. Please enter a .. d");
      end case;
   end loop;
exception
   when others =>
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Ada.Text_IO.Put_Line ("- Pico.Debug_IO.Test");
end Pico.Debug_IO.Test;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
