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
with AdaCL.Trace_Buffer;
with Pico.UART_IO;
with USB.Device;
with USB.Logging.Device;

package body Pico.Debug_IO is
   use type AdaCL.Trace_Buffer.ID_Type;

   package S renames Ada.Strings;
   package S_F renames Ada.Strings.Fixed;
   package B renames AdaCL.Trace_Buffer;

   procedure Initialise is
   begin
      Pico.UART_IO.Initialise;
   end Initialise;

   procedure Activate_USB_Logging is
   begin
      USB.Device.Set_Custom_Put_Line (AdaCL.Trace_Buffer.Put_Line'Access);
   end Activate_USB_Logging;

   procedure Print_USB_Log is
   begin
      loop
         declare
            Log_Event : constant String := USB.Logging.Device.Get_Log_Event_Image;
         begin
            exit when Log_Event'Length = 0;
            Pico.Debug_IO.Put_Line ("> USB Event : " & Log_Event);
         end;
      end loop;

      loop
         declare
            Text : B.Text_Type;
            ID   : B.ID_Type;
         begin
            B.Get_Line (Text, ID);
            exit when ID = B.ID_Type'First;
            Pico.Debug_IO.Put_Line ("> USB Line  : " & "ID: " & ID'Image & " " & S_F.Trim (Text, S.Right));
         end;
      end loop;
   end Print_USB_Log;

   procedure Put (Text : in Character) is
   begin
      Pico.UART_IO.Put (Text);
   end Put;

   procedure Put (Text : in String) is
   begin
      Pico.UART_IO.Put (Text);
   end Put;

   procedure Put_Line (Text : in String) is
   begin
      Pico.UART_IO.Put_Line (Text);
   end Put_Line;

   procedure New_Line is
   begin
      Pico.UART_IO.New_Line;
   end New_Line;

   procedure Get (Text : out Character) is
   begin
      Pico.UART_IO.Get (Text);
   end Get;

   procedure Get (Text : out String) is
   begin
      Pico.UART_IO.Get (Text);
   end Get;

   procedure Get_Line (Text : out String; Last : out Natural) is
   begin
      Pico.UART_IO.Get_Line (Text, Last);
   end Get_Line;

   procedure Read_Line (Text : out String; Last : out Natural) is
   begin
      Pico.UART_IO.Read_Line (Text, Last);
   end Read_Line;

   procedure Set_Write_Timeout (Timeout : Duration := 1.0) is
   begin
      Pico.UART_IO.Set_Write_Timeout (Timeout);
   end Set_Write_Timeout;

   procedure Set_Read_Timeout (Timeout : Duration := 10.0) is
   begin
      Pico.UART_IO.Set_Read_Timeout (Timeout);
   end Set_Read_Timeout;
end Pico.Debug_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
