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

with Ada.Exceptions;
with Ada.Real_Time;
with Ada.Text_IO;
with Pico.Debug_IO;
with Pico.UART_IO;
with RP.ADC;
with Pico.Analog.Input;

---
--  Analog Digital Converter from Chapter 9.1 from the Freenove C-Tutorial
--
procedure Sketch_09_1_ADC with
   No_Return
is
   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   Pin_Analog_In : constant RP.ADC.ADC_Channel      := 0;
   Period        : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.5);
   Next          : Ada.Real_Time.Time               := Ada.Real_Time.Clock;

   pragma Debug (Pico.Debug_IO.Initialise);
   pragma Debug (Pico.Debug_IO.Put_Line ("+ Sketch_09_1_ADC"));
begin
   pragma Debug (Pico.Debug_IO.Put_Line ("> Initialising Main"));

   Pico.UART_IO.Initialise;

   RP.ADC.Enable;
   RP.ADC.Set_Mode (RP.ADC.One_Shot);
   RP.ADC.Set_Sample_Bits (12);
   RP.ADC.Configure (Pin_Analog_In);

   Pico.UART_IO.Put_Line ("> Starting main loop");
   loop
      declare
         Analog     : constant RP.ADC.Analog_Value     := RP.ADC.Read (Pin_Analog_In);
         Microvolts : constant RP.ADC.Microvolts       := RP.ADC.Read_Microvolts (Pin_Analog_In);
         Volts      : constant Pico.Analog.Input.Volts := Pico.Analog.Input.Read_Volts (Pin_Analog_In);
      begin
         Pico.UART_IO.Put_Line
            ("Voltage Value: " & Analog'Image & " / " & Microvolts'Image & "µV / " & Volts'Image & "V");
      end;

      Next := @ + Period;
      delay until Next;
   end loop;
exception
   when E : others =>
      --  In release builds, debug output is disabled, so we use Ada.Text_IO to print the exception information to the
      --  console.
      Ada.Text_IO.Put_Line ("=== UNHANDLED EXCEPTION ===");
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Name (E));
      Ada.Text_IO.Put_Line ("! " & Ada.Exceptions.Exception_Message (E));
      pragma Debug (Pico.Debug_IO.Put_Line ("- Sketch_09_1_ADC"));
      raise;
end Sketch_09_1_ADC;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
