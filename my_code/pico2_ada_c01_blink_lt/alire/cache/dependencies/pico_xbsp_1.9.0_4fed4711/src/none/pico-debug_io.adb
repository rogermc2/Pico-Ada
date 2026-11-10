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

package body Pico.Debug_IO is
   procedure Initialise is null;
   procedure Activate_USB_Logging is null;
   procedure Print_USB_Log is null;
   procedure Put (Text : in Character) is null;
   procedure Put (Text : in String) is null;
   procedure Put_Line (Text : in String) is null;
   procedure New_Line is null;

   procedure Get (Text : out Character) is
   begin
      Text := ASCII.NUL;
   end Get;

   procedure Get (Text : out String) is
   begin
      Text := [others => ASCII.NUL];
   end Get;

   procedure Get_Line (Text : out String; Last : out Natural) is
   begin
      Text := [others => ASCII.NUL];
      Last := 0;
   end Get_Line;

   procedure Read_Line (Text : out String; Last : out Natural) is
   begin
      Text := [others => ASCII.NUL];
      Last := 0;
   end Read_Line;

   procedure Set_Write_Timeout (Timeout : Duration := 1.0) is null;
   procedure Set_Read_Timeout (Timeout : Duration := 10.0) is null;
end Pico.Debug_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
