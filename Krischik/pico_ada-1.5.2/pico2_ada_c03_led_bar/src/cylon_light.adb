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
with Pico;
with RP.GPIO;

--  -
--  Flowing LED sample from Chapter 3.1 from the Freenove C-Tutorial. Cylon real-time edition.
--
procedure Cylon_Light with
   No_Return
is
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Cylon_Light"));

   package RT renames Ada.Real_Time;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   --  -
   --  The LED bar has 10 LEDs
   --
   LED_Count : constant := 10;

   --  -
   --   GPIO Pins the LEDs are connected to
   --
   LEDs : constant array (1 .. LED_Count)
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

      --  -
      --  array to keep delay times to make the flow more organic
      --
   type Delay_Array_Type is
      array (1 .. LED_Count)
      of RT.Time_Span;

   --:  only one array is active the others are kept in the code for experimenting.
   --!pp off
   pragma Warnings (Off, "-gnatwu");

   --  Base (Base = 8.0 ms, Amplitude = 14.0 ms)
   --
   Delay_Times_Base : constant Delay_Array_Type := [
       1 => RT.To_Time_Span (0.150),
       2 => RT.To_Time_Span (0.126),
       3 => RT.To_Time_Span (0.105),
       4 => RT.To_Time_Span (0.089),
       5 => RT.To_Time_Span (0.081),
       6 => RT.To_Time_Span (0.081),
       7 => RT.To_Time_Span (0.089),
       8 => RT.To_Time_Span (0.105),
       9 => RT.To_Time_Span (0.126),
      10 => RT.To_Time_Span (0.150)
   ];
   --  Fast (Base = 6.0 ms, Amplitude = 12.0 ms) – feels snappier but still has clear easing:
   --
   Delay_Times_Fast : constant Delay_Array_Type := [
       1 => RT.To_Time_Span (0.120),
       2 => RT.To_Time_Span (0.099),
       3 => RT.To_Time_Span (0.081),
       4 => RT.To_Time_Span (0.068),
       5 => RT.To_Time_Span (0.061),
       6 => RT.To_Time_Span (0.061),
       7 => RT.To_Time_Span (0.068),
       8 => RT.To_Time_Span (0.081),
       9 => RT.To_Time_Span (0.099),
      10 => RT.To_Time_Span (0.120)
   ];
   --  Dramatic (Base = 10.0 ms, Amplitude = 20.0 ms) – almost pauses at the ends:
   --
   Delay_Times_Dramatic : constant Delay_Array_Type := [
       1 => RT.To_Time_Span (0.200),
       2 => RT.To_Time_Span (0.166),
       3 => RT.To_Time_Span (0.136),
       4 => RT.To_Time_Span (0.113),
       5 => RT.To_Time_Span (0.102),
       6 => RT.To_Time_Span (0.102),
       7 => RT.To_Time_Span (0.113),
       8 => RT.To_Time_Span (0.136),
       9 => RT.To_Time_Span (0.166),
      10 => RT.To_Time_Span (0.200)
   ];
   --  Gentle (Base = 10.0 ms, Amplitude = 6.0 ms) – subtle, almost constant but slightly organic:
   --
   Delay_Times_Gentle : constant Delay_Array_Type := [
       1 => RT.To_Time_Span (0.130),
       2 => RT.To_Time_Span (0.120),
       3 => RT.To_Time_Span (0.111),
       4 => RT.To_Time_Span (0.104),
       5 => RT.To_Time_Span (0.100),
       6 => RT.To_Time_Span (0.100),
       7 => RT.To_Time_Span (0.104),
       8 => RT.To_Time_Span (0.111),
       9 => RT.To_Time_Span (0.120),
      10 => RT.To_Time_Span (0.130)
   ];

   pragma Warnings (On, "-gnatwu");
   --!pp on

   Delay_Times : Delay_Array_Type renames Delay_Times_Dramatic;
   Next        : RT.Time := RT.Clock;

begin
   pragma Debug (Pico.UART_IO.Put_Line ("> Initialise"));
   for I in LEDs'Range loop
      LEDs (I).Configure (RP.GPIO.Output);
   end loop;

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      pragma Debug (Pico.UART_IO.Put_Line ("> Right to left"));
      for I in LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;

      pragma Debug (Pico.UART_IO.Put_Line ("> Left to Right"));
      for I in reverse LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;
   end loop;
end Cylon_Light;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
