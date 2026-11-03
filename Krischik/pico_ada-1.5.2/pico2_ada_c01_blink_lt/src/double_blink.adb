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

with Ada.Real_Time;
with Pico.UART_IO;

package body Double_Blink is
   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   procedure Blink_LED
      (LED      : in out RP.GPIO.GPIO_Point;
       On_Time  : in     Duration;
       Off_Time : in     Duration)
   is
      pragma Debug (Pico.UART_IO.Put_Line ("+ Double_Blink.Blink_LED"));

      On_Period  : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (On_Time);
      Off_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (Off_Time);
      Next       : Ada.Real_Time.Time               := Ada.Real_Time.Clock;
   begin
      LED.Configure (RP.GPIO.Output);

      loop
         --  On cycle
         LED.Set;
         Next := @ + On_Period;
         delay until Next;

         --  Off cycle
         LED.Clear;
         Next := @ + Off_Period;
         delay until Next;
      end loop;
   end Blink_LED;

   task body Core_2 is
      pragma Debug (Pico.UART_IO.Put_Line ("+ Double_Blink.Core_2"));
   begin
      Blink_LED
         (LED      => Internal_LED,
          On_Time  => 1.009,
          Off_Time => 0.503);
   end Core_2;
end Double_Blink;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
