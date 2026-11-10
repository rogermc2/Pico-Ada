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

with Ada.Interrupts.Names;
with Ada.Real_Time;
with HAL;
with Pico_Xbsp_Config;
with RP.Device;
with System;
with USB.Device.Serial;
with USB.Device;

package body Pico.USB_IO is
   use type Ada.Real_Time.Time;
   use type Ada.Real_Time.Time_Span;
   use type HAL.UInt32;
   use type USB.Device.Init_Result;

   Max_Packet_Size         : constant                := USB.Control_Packet_Size'Last;
   USB_Stack               : USB.Device.USB_Device_Stack (Max_Classes => 1);
   USB_Serial              :
      aliased USB.Device.Serial.Default_Serial_Class
         (TX_Buffer_Size => Pico_Xbsp_Config.USB_TX_Buffer_Size,
          RX_Buffer_Size => Pico_Xbsp_Config.USB_RX_Buffer_Size);
   Write_Max_Retries       : Positive                := 100;
   Read_Max_Retries        : Positive                := 100;
   Write_Timeout_Per_Retry : Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (1.0 / Write_Max_Retries);
   Read_Timeout_Per_Retry  : Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (10.0 / Read_Max_Retries);

   -------------------------------------------------------------------------------

   protected USB_Stack_Access with
      Interrupt_Priority => System.Max_Interrupt_Priority
   is
      procedure USB_Int_Handler with
         Attach_Handler => Ada.Interrupts.Names.USBCTRL_Interrupt_CPU_2;
   end USB_Stack_Access;

   protected body USB_Stack_Access is
      procedure USB_Int_Handler is
      begin
         if USB_Stack.Initialized then
            USB_Stack.Poll;
         end if;
         return;
      end USB_Int_Handler;
   end USB_Stack_Access;
   pragma Unreferenced (USB_Stack_Access);

   -------------------------------------------------------------------------------

   procedure Initialise is
      Status : USB.Device.Init_Result;
   begin
      if not USB_Stack.Initialized then
         if not USB_Stack.Register_Class (USB_Serial'Unchecked_Access) then
            raise Initialisation_Error with "Failed to register USB Serial device class";
         end if;

         Status := USB_Stack.Initialize
               (Controller      => RP.Device.UDC'Access,
                Manufacturer    => USB.To_USB_String ("Raspberry Pi Pico"),
                Product         => USB.To_USB_String ("Pico.USB_IO (Ada)"),
                Serial_Number   => USB.To_USB_String ("4F72A1C3D9B8E7F1"),
                Max_Packet_Size => Max_Packet_Size,
                Vendor_Id       => 16#2e8a#,
                Product_Id      => 16#000c#,
                Bcd_Device      => 16#0121#);

         if Status /= USB.Device.Ok then
            raise Initialisation_Error with "USB stack initialization failed: " & Status'Image;
         end if;

         USB_Stack.Start;
      end if;

      return;
   end Initialise;

   procedure Put (Text : in Character) is
      Text_Bytes    : constant String (1 .. 1) := [1 => Text];
      Bytes_Written : HAL.UInt32;
      Next          : Ada.Real_Time.Time       := Ada.Real_Time.Clock;
   begin
      for Repeat in 1 .. Write_Max_Retries loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Write (RP.Device.UDC, Text_Bytes, Bytes_Written);

            if Bytes_Written = Text_Bytes'Length then
               goto Finished;
            end if;
         end if;

         Next := Next + Write_Timeout_Per_Retry;
         delay until Next;
      end loop;

      raise Timeout_Error with "Failed to transmit '" & Text & "'.";
      <<Finished>>
      return;
   end Put;

   procedure Put (Text : in String) is
      Bytes_Written : HAL.UInt32         := 0;
      First         : Positive           := 1;
      Next          : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      for Repeat in 1 .. Write_Max_Retries loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Write (RP.Device.UDC, Text (First .. Text'Last), Bytes_Written);

            --  Only part of the data was written, update the first index to write the remaining data in the next loop
            --  iteration.
            First := First + Natural (Bytes_Written);

            if First > Text'Last then
               --  All data was written, exit the loop.
               goto Finished;
            end if;
         else
            --  DTE is not present, reset the bytes written to zero to trigger the delay.
            Bytes_Written := 0;
         end if;

         --  Only delay if no bytes were written, otherwise try to write the remaining bytes immediately as the ring
         --  buffer can fragment at the wrap around.
         if Bytes_Written = 0 then
            Next := Next + Write_Timeout_Per_Retry;
            delay until Next;
         end if;
      end loop;

      raise Timeout_Error with "Failed to transmit " & Text'Length'Image & " bytes.";
      <<Finished>>
      return;
   end Put;

   procedure Put_Line (Text : in String) is
   begin
      Put (Text & ASCII.CR & ASCII.LF);
   end Put_Line;

   procedure New_Line is
   begin
      Put (ASCII.CR & ASCII.LF);
   end New_Line;

   procedure Get (Text : out Character) is
      Read_String : String (1 .. 1);
      Bytes_Read  : HAL.UInt32;
      Next        : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      for Repeat in 1 .. Read_Max_Retries loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Read (Read_String, Bytes_Read);

            if Bytes_Read = Read_String'Length then
               goto Finished;
            end if;
         end if;

         Next := Next + Read_Timeout_Per_Retry;
         delay until Next;
      end loop;

      raise Timeout_Error with "Failed to receive character.";
      <<Finished>>
      Text := Read_String (1);
      return;
   end Get;

   procedure Get (Text : out String) is
      Bytes_Read : HAL.UInt32;
      Last       : Natural;
      Next       : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      Last := Text'First - 1;

      for Repeat in 1 .. Read_Max_Retries loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Read (Text (Text'First + Last .. Text'Last), Bytes_Read);

            Last := @ + Integer (Bytes_Read);

            if Last >= Text'Last then
               goto Finished;
            end if;
         end if;

         Next := Next + Read_Timeout_Per_Retry;
         delay until Next;
      end loop;

      raise Timeout_Error with "Failed to receive string.";
      <<Finished>>
   end Get;

   procedure Get_Line (Text : out String; Last : out Natural) is
      Read_String : String (1 .. 1);
      Bytes_Read  : HAL.UInt32;
      Next        : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      Last := Text'First - 1;

      for Repeat in 1 .. Read_Max_Retries loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Read (Read_String, Bytes_Read);

            if Bytes_Read > 0 then
               if Read_String (1) in ASCII.CR | ASCII.LF then
                  goto Finished;
               end if;

               Last        := @ + 1;
               Text (Last) := Read_String (1);

               if Last >= Text'Last then
                  goto Finished;
               end if;
            else
               Next := Next + Read_Timeout_Per_Retry;
               delay until Next;
            end if;
         end if;
      end loop;

      raise Timeout_Error with "Failed to receive line.";
      <<Finished>>
      return;
   end Get_Line;

   procedure Read_Line (Text : out String; Last : out Natural) is
      Read_String : String (1 .. 1);
      Bytes_Read  : HAL.UInt32;
      Next        : Ada.Real_Time.Time := Ada.Real_Time.Clock;
   begin
      Last := Text'First - 1;

      loop
         if USB_Serial.List_Ctrl_State.DTE_Is_Present then
            USB_Serial.Read (Read_String, Bytes_Read);

            if Bytes_Read > 0 then
               Put (Read_String (1));

               if Read_String (1) in ASCII.CR | ASCII.LF then
                  exit;
               elsif Read_String (1) = ASCII.BS then
                  if Last > Text'First then
                     Last := @ - 1;
                     Put (' ');
                     Put (ASCII.BS);
                  end if;
               else
                  Last        := @ + 1;
                  Text (Last) := Read_String (1);
               end if;

               if Last > Text'Last then
                  exit;
               end if;
            else
               Next := Next + Read_Timeout_Per_Retry;
               delay until Next;
            end if;
         end if;
      end loop;

      return;
   end Read_Line;

   procedure Set_Write_Timeout (Timeout : Duration := 1.0; Retries : Positive := 1_000) is
   begin
      Write_Max_Retries       := Retries;
      Write_Timeout_Per_Retry := Ada.Real_Time.To_Time_Span (Timeout / Write_Max_Retries);
   end Set_Write_Timeout;

   procedure Set_Read_Timeout (Timeout : Duration := 10.0; Retries : Positive := 10_000) is
   begin
      Read_Max_Retries       := Retries;
      Read_Timeout_Per_Retry := Ada.Real_Time.To_Time_Span (Timeout / Read_Max_Retries);
   end Set_Read_Timeout;
end Pico.USB_IO;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
