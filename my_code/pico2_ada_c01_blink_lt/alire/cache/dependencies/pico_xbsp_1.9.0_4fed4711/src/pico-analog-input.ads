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

with RP.ADC;

--  The VREF of 3.3 is not a divisor of any binary fraction, so the compiler warns about the rounding in the conversion
--  factor. We deliberately ignore that warning as we aim for binary fixed-point math for performance, not decimal
--  fixed-point math.
pragma Warnings (Off, "*gnatwb*");

---
--  Convenience layer that turns the raw micro-volt readings from the RP2040 / RP2350 ADC into a clean fixed-point
--  voltage type.
--
--  The ADC is slightly noisy near the rails, so we deliberately clamp everything below 20 mV to 0.0 V and everything
--  above 3.28 V to 3.3 V. That gives us a rock-solid 0.0 … 3.3 V range that is pleasant to work with in the
--  higher-level tutorial sketches.
package Pico.Analog.Input with
   Spark_Mode => On
is
   -----------------------------------------------------------------------
   --  Voltage type
   -----------------------------------------------------------------------

   --  Base_Volts is a binary fixed-point type that is used for the conversion. It needs a larger range, both for
   --  'Last and 'Small than the final Volts type to avoid overflow and underflow during the conversion.
   type Base_Volts is delta 0.000_1 range 0.0 .. 2.0**14 with
      Small => 2.0**(-16), Size => 32;
   subtype Volts is Base_Volts range 0.0 .. 3.3;

   -----------------------------------------------------------------------
   --  Conversion
   -----------------------------------------------------------------------

   --  Convert a raw analog value into the clamped Volts type.
   function To_Volts (Analog : RP.ADC.Analog_Value) return Volts with
      Inline, Pure_Function;

   -----------------------------------------------------------------------
   --  High-level reading
   -----------------------------------------------------------------------

   --  One-liner that reads the chosen ADC channel and returns the voltage already clamped to the useful range.
   function Read_Volts (Channel : RP.ADC.ADC_Channel) return Volts is (To_Volts (RP.ADC.Read (Channel))) with
      Global => null,          --  pure as far as SPARK is concerned
      Inline;

private
   use type RP.ADC.Analog_Value;

   VREF      : constant Base_Volts          := Volts'Last;                         -- 3.3V
   Max_Count : constant Base_Volts          := Base_Volts (RP.ADC.Analog_Value'Last);
   Floor     : constant RP.ADC.Analog_Value := 20;                                 -- ≈16mV
   Ceiling   : constant RP.ADC.Analog_Value := RP.ADC.Analog_Value'Last - Floor;   -- ≈3.28V

   function To_Volts (Analog : RP.ADC.Analog_Value) return Volts is
      (if Analog >= Ceiling then Volts'Last
       elsif Analog <= Floor then Volts'First
       else Base_Volts (Base_Volts (Analog) * VREF) / Max_Count);

end Pico.Analog.Input;

--------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
