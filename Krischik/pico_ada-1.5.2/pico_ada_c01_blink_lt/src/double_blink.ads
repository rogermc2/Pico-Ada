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

with RP.GPIO;
with Pico;

---
--  Sample to make both the internal and an external LED blink at different rates using both cores of the RP2040.
--
package Double_Blink is

   ---
   --  Setting up the external and internal LED
   --
   Internal_LED  : RP.GPIO.GPIO_Point renames Pico.GP25;
   Externnal_LED : RP.GPIO.GPIO_Point renames Pico.GP15;

   ---
   --  Task to run on the 2nd core of the RP2040. Since it's a task (and not a task type) the task will be started
   --  automatically.
   --
   task Core_2 with
      Cpu => 2
   ;

   ---
   --  Blinks an LED attached to a Raspberry Pi Pico
   --
   --: @param LED GPIO Pin the LED is attached to.
   --: @param On_Time Time the LED stays on.
   --: @param Off_Time Time the LED stays off.
   procedure Blink_LED
      (LED      : in out RP.GPIO.GPIO_Point;
       On_Time  : in     Duration;
       Off_Time : in     Duration) with
      No_Return, Global => null;

end Double_Blink;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
