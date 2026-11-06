--------------------------------------------------------------- {{{1 ----------
--: Copyright © 2023 … 2025 Martin Krischik «krischik@users.sourceforge.net»
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

with AUnit;
with AdaCL.Trace_Buffer.Test;

package body AdaCL_Embedded_Test.Suite is
   Trace_Buffer_Tests : aliased AdaCL.Trace_Buffer.Test.Test_Case;
   Retval             : aliased AUnit.Test_Suites.Test_Suite;

   function Suite return AUnit.Test_Suites.Access_Test_Suite is

      use AUnit.Test_Suites;
   begin
      Add_Test (Retval'Access, Trace_Buffer_Tests'Access);

      return Retval'Access;
   end Suite;
end AdaCL_Embedded_Test.Suite;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=expr :
--: vim: set spell spelllang=en_gb
