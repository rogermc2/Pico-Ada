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

--  No-op implementation when Event_Log_Buffer_Size = 0
package body AdaCL.Trace_Buffer with
   Spark_Mode => On, Refined_State => (Ring_Buffer => null)
is
   procedure Reset is null;

   procedure Put_Line (Str : in String) is null;

   procedure Get_Line (Text : out Text_Type; ID : out ID_Type) is
   begin
      Text := [others => ' '];
      ID   := ID_Type'First;
   end Get_Line;

   function Has_Line return Boolean is (False);

   function Pending_Lines return Natural is (0);
end AdaCL.Trace_Buffer;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
