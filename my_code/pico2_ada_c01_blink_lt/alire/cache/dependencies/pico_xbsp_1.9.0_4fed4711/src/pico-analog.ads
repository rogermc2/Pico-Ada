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

with Pico.Utils;
with HAL;

---
--  Base Package for Analogue in (DAC) and out (PMW).
--
package Pico.Analog is
   use type HAL.UInt8;

   ---
   --  Analogue value as fixed point percentage.
   --
   type Percentage is delta 0.1 digits 4 range 0.0 .. 100.0;

   ---
   --  Analogue value as 8-bit value (for compatibility with C code).
   --
   subtype Analog_Level is HAL.UInt8;

   ---
   --  Map an input value from a custom range directly to a Percentage (0.0 .. 100.0).
   --
   --  This is a convenient shortcut that scales any integer input (for example from an ADC, a sensor, or a counter)
   --  into the full percentage range used by ``Write_Analog``. It gives you 1000 distinct levels (0.0, 0.1, 0.2 …
   --  99.9, 100.0) which provides finer control than the 256 levels of ``Analog_Level``.
   --
   --  Internally it first calls ``Pico.Utils.Map`` to get a value in the range 0..999, then converts that to
   --  ``Percentage``. The division by 10 is done by the fixed-point type itself — you do **not** need to split
   --  the integer manually.
   --
   --  Example:
   --    --  Convert a potentiometer reading (0..1023) to a PWM percentage
   --    Brightness := Map (Pot_Value, 0, 1023);
   --    Write_Analog (LED_Point, Brightness);
   --
   --: @param In_Value  Value to be mapped
   --: @param In_Min    Lower bound of the input range
   --: @param In_Max    Upper bound of the input range
   --: @return          Value scaled to the range 0.0 .. 100.0 as Percentage
   function Map_Percentage
      (In_Value : in Integer;
       In_Min   : in Integer;
       In_Max   : in Integer)
       return Percentage is (Percentage (Pico.Utils.Map (In_Value, In_Min, In_Max, 0, 999)) / 10) with
      Inline, Pure_Function;

   ---
   --  Map an input value from a custom range directly to an Analog_Level (0..255).
   --
   --  This is a convenient shortcut for the common case where you want to convert a sensor reading or any integer
   --  value into an 8-bit analogue output suitable for PWM. It internally calls ``Pico.Utils.Map`` and scales the
   --  result to the full range of ``Analog_Level``.
   --
   --  Example:
   --    --  Convert a potentiometer reading (0..1023) to PWM level
   --    LED_Level := Map (Pot_Value, 0, 1023);
   --
   --: @param In_Value  Value to be mapped
   --: @param In_Min    Lower bound of the input range
   --: @param In_Max    Upper bound of the input range
   --: @return          Value scaled to the range 0..255 as Analog_Level
   function Map_Analog_Level
      (In_Value : in Integer;
       In_Min   : in Integer;
       In_Max   : in Integer)
       return Analog_Level is
      (Analog_Level
          (Pico.Utils.Map
              (In_Value, In_Min, In_Max, Integer (Analog_Level'First), Integer (Analog_Level'Last - 1)))) with
      Inline, Pure_Function;

end Pico.Analog;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
