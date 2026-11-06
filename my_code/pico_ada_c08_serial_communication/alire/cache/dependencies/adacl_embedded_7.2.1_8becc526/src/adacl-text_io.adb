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
pragma Profile (Jorvik);

package body AdaCL.Text_IO with
   Spark_Mode => On
is

   procedure New_Line is
   begin
      Ada.Text_IO.New_Line;
   end New_Line;

   function Get return Character is
      Retval : Character;
   begin
      Ada.Text_IO.Get (Retval);
      return Retval;
   end Get;

   procedure Get (Text : out String) is
   begin
      for I in Text'Range loop
         Ada.Text_IO.Get (Text (I));
      end loop;
   end Get;

   procedure Get_Line (Text : out String; Last : out Natural) is
      Char : Character;
   begin
      Last := Text'First - 1;

      while Last < Text'Last loop
         pragma Loop_Variant (Increases => Last);
         pragma Loop_Invariant (Last in Text'First - 1 .. Text'Last);

         Get (Char);

         exit when Char in ASCII.CR | ASCII.LF;

         Last        := @ + 1;
         Text (Last) := Char;
      end loop;
   end Get_Line;
end AdaCL.Text_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
