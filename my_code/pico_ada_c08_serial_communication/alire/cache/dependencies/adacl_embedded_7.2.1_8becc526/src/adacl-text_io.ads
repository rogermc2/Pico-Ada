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

with Ada.Text_IO;

-------------------------------------------------------------------------
--  @summary
--  This package extends the embedded version of `Ada.Text_IO` with the missing `Get` operations.
--
--  @description
--  While originally developed for the Raspberry Pi Pico — where I/O happens via SWD — it is more general and
--  useful for any embedded use where the full standard library is not available. For other platforms the user will
--  need to check how the I/O is handled.
-------------------------------------------------------------------------
package AdaCL.Text_IO with
   Spark_Mode => On
is

   ---
   --  Sends a single character.
   procedure Put (Text : in Character) renames Ada.Text_IO.Put;

   ---
   --  Sends a string (no newline added).
   procedure Put (Text : in String) renames Ada.Text_IO.Put;

   ---
   --  Sends a string followed by a newline.
   procedure Put_Line (Text : in String) renames Ada.Text_IO.Put_Line;

   ---
   --  Sends a newline.
   procedure New_Line with
      Inline;

   ---
   --  Reads one character.
   --
   --  @param Text character read
   procedure Get (Text : out Character) renames Ada.Text_IO.Get;

   --  Reads one character.
   --
   --  @param Text character read
   function Get return Character with Inline, Side_Effects;

   --  Reads characters into the string.
   --
   --  @param Text characters read
   procedure Get (Text : out String) with
      Pre => Text'Length > 0;

   ---
   --  Reads characters until a newline is received or time-out is reached.
   --
   --: @param Text character line read
   --: @param Last last character read
   procedure Get_Line (Text : out String; Last : out Natural) with
      Pre => Text'Length > 0, Post => Last in Text'First - 1 .. Text'Last, Relaxed_Initialization => Text;

end AdaCL.Text_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
