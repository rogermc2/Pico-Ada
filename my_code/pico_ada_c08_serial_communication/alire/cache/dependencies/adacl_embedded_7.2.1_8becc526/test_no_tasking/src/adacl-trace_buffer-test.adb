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

with AUnit.Assertions;
with Ada.Strings.Fixed;

package body AdaCL.Trace_Buffer.Test is
   use AUnit.Assertions;

   package S renames Ada.Strings;
   package S_F renames Ada.Strings.Fixed;

   Input : constant String := "Test Message";

   procedure Test_Put_Line_01 (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Trace_Buffer.Reset;
      Trace_Buffer.Put_Line ("Test 1");

      Assert (Trace_Buffer.Has_Line = True, "A line avalable.");
      Assert (Trace_Buffer.Pending_Lines = 1, "One lines avalable");

      return;
   end Test_Put_Line_01;

   procedure Test_Get_Line_01 (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Text : Text_Type;
      ID   : ID_Type;
   begin
      Trace_Buffer.Reset;
      Trace_Buffer.Get_Line (Text, ID);

      Assert (ID = 0, "ID should be zero");
      Assert (Text, Text_Type'(others => ' '), "Text should be spaces.");
      Assert (Trace_Buffer.Has_Line = False, "No lines avalable.");
      Assert (Trace_Buffer.Pending_Lines = 0, "No lines avalable");

      return;
   end Test_Get_Line_01;

   procedure Test_Buffer_Line_01 (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Text : Text_Type;
      ID   : ID_Type;
   begin
      Trace_Buffer.Reset;
      Trace_Buffer.Put_Line (Input);

      Assert (Trace_Buffer.Has_Line = True, "A line is avalable.");
      Assert (Trace_Buffer.Pending_Lines = 1, "One line is avalable");

      Trace_Buffer.Get_Line (Text, ID);

      Assert (ID = 0, "ID should be zero");
      Assert (S_F.Trim (Text, S.Right), Input, "Output text should be equal input text.");
      Assert (Trace_Buffer.Has_Line = False, "No lines avalable.");
      Assert (Trace_Buffer.Pending_Lines = 0, "No lines avalable");

      return;
   end Test_Buffer_Line_01;

   procedure Test_Buffer_Line_02 (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Text : Text_Type;
      ID   : ID_Type;
   begin
      Trace_Buffer.Reset;

      for I in 1 .. 7 loop
         Trace_Buffer.Put_Line (Input & I'Image);

         Assert (Trace_Buffer.Has_Line = True, "A line is avalable.");
         Assert (Trace_Buffer.Pending_Lines = I, I'Image & " lines are avalable");
      end loop;

      for I in 1 .. 7 loop
         Trace_Buffer.Get_Line (Text, ID);

         Assert (ID = ID_Type (I - 1), "ID should be " & I'Image & " - 1");
         Assert (S_F.Trim (Text, S.Right), Input & I'Image, "Output text should be equal input text.");
      end loop;

      Assert (Trace_Buffer.Has_Line = False, "No lines avalable.");
      Assert (Trace_Buffer.Pending_Lines = 0, "No lines avalable");

      return;
   end Test_Buffer_Line_02;

   procedure Test_Buffer_Line_03 (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Text : Text_Type;
      ID   : ID_Type;
   begin
      Trace_Buffer.Reset;

      for I in 1 .. 7 loop
         Trace_Buffer.Put_Line (Input & I'Image);
         Trace_Buffer.Get_Line (Text, ID);

         Assert (S_F.Trim (Text, S.Right), Input & I'Image, "Output text should be equal input text.");
      end loop;

      Assert (Trace_Buffer.Has_Line = False, "No lines avalable.");
      Assert (Trace_Buffer.Pending_Lines = 0, "No lines avalable");

      return;
   end Test_Buffer_Line_03;

   --: -----------------------------------------------------------------------

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Put_Line_01'Access, "Test_Put_Line_01 : put one line.");
      Register_Routine (T, Test_Get_Line_01'Access, "Test_Get_Line_01 : get one line.");
      Register_Routine (T, Test_Buffer_Line_01'Access, "Test_Buffer_Line_01 : buffer one line.");
      Register_Routine (T, Test_Buffer_Line_02'Access, "Test_Buffer_Line_02 : buffer seven lines.");
      Register_Routine (T, Test_Buffer_Line_03'Access, "Test_Buffer_Line_03 : async buffer seven lines.");

      return;
   end Register_Tests;
end AdaCL.Trace_Buffer.Test;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=0 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=expr :
--: vim: set spell spelllang=en_gb
