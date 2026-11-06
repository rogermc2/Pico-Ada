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
pragma Partition_Elaboration_Policy (Sequential);

with Ada.Strings.Fixed;

package body AdaCL.Trace_Buffer with
   Spark_Mode => On, Refined_State => (Ring_Buffer => Buffer)
is
   package S renames Ada.Strings;
   package S_F renames Ada.Strings.Fixed;

   --  Ring buffer index type (modulo arithmetic for circular behaviour).
   type Index is mod Adacl_Embedded_Config.Event_Log_Buffer_Size;

   --  The actual ring buffer.
   type Lines is
      array (Index)
      of Log_Event;

   protected Buffer is
      procedure Reset;
      procedure Put_Line (Str : String) with
         Pre => Str'Length <= Adacl_Embedded_Config.Event_Log_Buffer_Length;
      procedure Get_Log (Log : out Log_Event);
      function Has_Line return Boolean;
      function Pending_Lines return Natural;
   private
      Data        : Lines;
      Write_Index : Index   := Index'First;
      Read_Index  : Index   := Index'First;
      Current_ID  : ID_Type := ID_Type'First;
   end Buffer;

   protected body Buffer is
      procedure Reset is
      begin
         Write_Index := Index'First;
         Read_Index  := Index'First;
         Current_ID  := ID_Type'First;
      end Reset;

      procedure Put_Line (Str : String) is
      begin
         Data (Write_Index).ID := Current_ID;
         S_F.Move
            (Source  => Str,
             Target  => Data (Write_Index).Text,
             Drop    => S.Right,
             Justify => S.Left,
             Pad     => S.Space);

         Current_ID  := @ + 1;
         Write_Index := @ + 1;
      end Put_Line;

      procedure Get_Log (Log : out Log_Event) is
      begin
         Log        := Data (Read_Index);
         Read_Index := @ + 1;
      end Get_Log;

      function Has_Line return Boolean is (Write_Index /= Read_Index);
      function Pending_Lines return Natural is
         (if Write_Index >= Read_Index then Natural (Write_Index - Read_Index)
          else Natural (Write_Index - Read_Index + Index'Last + 1));
   end Buffer;

   procedure Reset is
   begin
      Buffer.Reset;
   end Reset;

   procedure Put_Line (Str : String) is
   begin
      Buffer.Put_Line (Str);
   end Put_Line;

   procedure Get_Line (Text : out Text_Type; ID : out ID_Type) is
      Buffer_Has_Line : constant Boolean := Buffer.Has_Line;
   begin
      if not Buffer_Has_Line then
         Text := [others => ' '];
         ID   := ID_Type'First;
      else
         declare
            Event : Log_Event;
         begin
            Buffer.Get_Log (Event);
            Text := Event.Text;
            ID   := Event.ID;
         end;
      end if;
   end Get_Line;

   function Has_Line return Boolean is
      Retval : constant Boolean := Buffer.Has_Line;
   begin
      return Retval;
   end Has_Line;

   function Pending_Lines return Natural is
      Retval : constant Natural := Buffer.Pending_Lines;
   begin
      return Retval;
   end Pending_Lines;

end AdaCL.Trace_Buffer;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
