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

with Ada.Exceptions;
with Ada.Real_Time;
with Pico.Analog.RGB_LED;
with Pico.Analog;
with Pico.UART_IO;

---
--  RGB weel LED sample from Chapter 5.2 from the Freenove C-Tutorial.
--
procedure Sketch_05_2_Gradient_Color_Light with
   No_Return
is
   use Pico.Analog.RGB_LED;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   ---
   --   GPIO Pins the RGB LED is connected to.
   --
   LED : constant Color_Array :=
      [Pico.Analog.To_PWM (Pico.GP11),
      Pico.Analog.To_PWM (Pico.GP12),
      Pico.Analog.To_PWM (Pico.GP13)];

   --  @summary
   --  Return a 24-bit RGB colour for the given wheel position.
   --
   --  @description
   --  The function maps a value in the range 0..255 onto the full colour wheel:
   --    0   = red
   --    85  = green
   --    170 = blue
   --    255 = red again
   --
   --  The original C code used `long` and `int` for historical reasons (old 8-bit/16-bit microcontrollers). On the
   --  RP2040 we use much more appropriate types:
   --
   --  * `Analog_Level` for the input (0..255) — matches the PWM resolution
   --    you normally use on the Pico.
   --  * `RGB_Color` for the return value — exactly 24 bits, with modular
   --    arithmetic that the compiler optimises to simple bitwise operations.
   --
   --  @param Pos
   --    Position on the colour wheel (0..255).  Values outside this range
   --    are reduced modulo 256 automatically.
   --
   --  @return
   --    A 24-bit RGB colour value ready to be passed to `Set_Color`.
   --
   --  @example
   --    --  Slowly cycle through all colours
   --    for I in Pico.Analog.Analog_Level loop
   --       Set_Color (My_LED, Wheel (I));
   --       delay 0.02;
   --    end loop;
   function Wheel (Pos : Pico.Analog.Analog_Level) return RGB_Color is
      pragma Debug (Pico.UART_IO.Put_Line ("+ Wheel (Pos => " & Pos'Image & ')'));

      Retval : RGB_Color := RGB_Color (Pos);
   begin
      if Retval < 85 then
         --  Red -> Green
         Retval := ((255 - @ * 3) * 2**16) or ((@ * 3) * 2**8);
      elsif Retval < 170 then
         --  Green -> Blue
         Retval := @ - 85;
         Retval := ((255 - @ * 3) * 2**8) or (@ * 3);
      else
         --  Blue -> Red
         Retval := @ - 170;
         Retval := ((@ * 3) * 2**16) or (255 - @ * 3);
      end if;

      pragma Debug (Pico.UART_IO.Put_Line ("- Wheel (Retval => " & Retval'Image & ')'));
      return Retval;
   end Wheel;

   Hold_Period : constant Ada.Real_Time.Time_Span := Ada.Real_Time.To_Time_Span (0.05);
   Next        : Ada.Real_Time.Time               := Ada.Real_Time.Clock;

begin
   pragma Debug (Pico.UART_IO.Initialise);
   pragma Debug (Pico.UART_IO.Put_Line ("+ Sketch_05_2_Gradient_Color_Light"));

   pragma Debug (Pico.UART_IO.Put_Line ("> Starting main loop"));
   loop
      for I in Pico.Analog.Analog_Level loop
         Set_Color (LED, Wheel (I));

         Next := @ + Hold_Period;
         delay until Next;
      end loop;
   end loop;

exception
   when E : others =>
      pragma Debug (Pico.UART_IO.Put_Line ("=== UNHANDLED EXCEPTION ==="));
      pragma Debug (Pico.UART_IO.Put_Line (Ada.Exceptions.Exception_Name (E)));
      pragma Debug (Pico.UART_IO.Put_Line (Ada.Exceptions.Exception_Message (E)));
      pragma Debug (Pico.UART_IO.Put_Line ("- Sketch_05_1_Random_Color_Light"));
      raise;
end Sketch_05_2_Gradient_Color_Light;

---------------------------------------------------------------- {{{ ----------
--: vim: set textwidth=120 nowrap tabstop=8 shiftwidth=3 softtabstop=3 expandtab :
--: vim: set filetype=ada fileencoding=utf-8 fileformat=unix foldmethod=marker :
--: vim: set spell spelllang=en_gb :
