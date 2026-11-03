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

with Ada.Numerics.Elementary_Functions;
with Ada.Real_Time;
with Pico.UART_IO;
with Pico;
with RP.GPIO;

---
--  Flowing LED sample from Chapter 3.1 from the Freenove C-Tutorial. Cylon real-time edition with floating point
--  arithmetic.
--
procedure Cylon_Light_Float with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Cylon_Light_Float"));

   package RT renames Ada.Real_Time;
   package Num renames Ada.Numerics;
   package Math renames Ada.Numerics.Elementary_Functions;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   LED_Count  : constant := 10;         --  The LED bar has 10 LEDs
   Base_Delay : constant := 0.06;       --  fastest speed (middle, seconds)
   Amplitude  : constant := 0.12;       --  how much slower at ends (seconds)

   ---
   --  Range of LEDs connected
   --
   type LED_Number is range 1 .. LED_Count;

      ---
      --  array to keep delay times to make the flow more organic
      --
   type Delay_Array_Type is
      array (LED_Number)
      of RT.Time_Span;

   ---
   --  Calculate the delay time in accordance to the given Base_Delay_ms and
   --
   --  @param LED the for which a delay should be calculated
   --  @return Delay as time span.
   function Delay_Time (LED : in LED_Number) return Ada.Real_Time.Time_Span with
      Inline, Pure_Function
   is
      pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_01_1_Blink (LED => " & LED'Image & ")"));

      Position : constant Float        := Float (LED - LED_Number'First) / Float (LED_Number'Last - LED_Number'First);
      Phase    : constant Float        := Position * Num.Pi;                -- 0 → π
      Factor   : constant Float        := (1.0 - Math.Sin (Phase)) / 2.0;   -- 0 … 1.0
      Retval   : constant RT.Time_Span := RT.To_Time_Span (Duration (Base_Delay + Amplitude * Factor));
   begin
      pragma Debug (Pico.UART_IO.Put_Line ("- Sketch_01_1_Blink (Retval => " & Retval'Image & ")"));
      return Retval;
   end Delay_Time;

   ---
   --   GPIO Pins the LEDs are connected to
   --
   LEDs : constant array (LED_Number)
      of access RP.GPIO.GPIO_Point :=
      [Pico.GP16'Access,
      Pico.GP17'Access,
      Pico.GP18'Access,
      Pico.GP19'Access,
      Pico.GP20'Access,
      Pico.GP21'Access,
      Pico.GP22'Access,
      Pico.GP26'Access,
      Pico.GP27'Access,
      Pico.GP28'Access];
   ---
   --   cache delay times
   --
   Delay_Times : constant Delay_Array_Type := [for I in LED_Number => Delay_Time (I)];
   ---
   --  Remember time for delay
   --
   Next : RT.Time := RT.Clock;

begin
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_01_1_Blink"));

   --  Configure the 10 GPIO Pins of the LEDs
   --
   for I in LEDs'Range loop
      LEDs (I).Configure (RP.GPIO.Output);
   end loop;

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      --  loop right to left
      --
      for I in LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;

      --  loop left to right
      --
      for I in reverse LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;
   end loop;
end Cylon_Light_Float;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
