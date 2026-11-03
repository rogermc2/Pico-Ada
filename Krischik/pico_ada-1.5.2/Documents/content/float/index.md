---
title       : "Side Quest: Floating Point Fixed"
description : "Floating point support for the **Raspberry Pi Pico** is now fixed."
summary     : "Floating point support for the **Raspberry Pi Pico** is now fixed."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T16:52:58+0200
date        : 2026-03-30T18:44:57+0200
draft       : false
type        : "page"
layout      : "single"
categories  : ["hardware", "side-quest", "pico-2w", "pico", "float"]
tags        : ["alire"]
---

## Using floating point

In [Chapter 3 – “Cylon” LED Bar](pico_ada_c03_led_bar) I mentioned that floating-point support was broken for the
**Raspberry Pi Pico**. This has now been fixed thanks to [Jeremy Grosser](https://github.com/JeremyGrosser). All you
need to do is update the version of `rp2040_hal` in your **alire.toml** file:

```toml
[[depends-on]]
rp2040_hal = "^2.7.1"
```

That’s it — floating-point mathematics now works correctly.

## Floating-point Cylon scanner

Now let’s look at the actual floating-point version of the Cylon scanner:

```ada
pragma License (Modified_Gpl);
pragma Ada_2022;
pragma Extensions_Allowed (On);

with Pico;
with RP.GPIO;
with Ada.Real_Time;
with Ada.Numerics.Elementary_Functions;

---
--  Flowing LED sample from Chapter 3.1 of the Freenove C tutorial.
--  Cylon real-time edition using floating-point arithmetic.
--
procedure Cylon_Light_Float with
   No_Return
is
   package RT   renames Ada.Real_Time;
   package Num  renames Ada.Numerics;
   package Math renames Ada.Numerics.Elementary_Functions;

   use type Ada.Real_Time.Time_Span;
   use type Ada.Real_Time.Time;

   LED_Count   : constant := 10;         --  The LED bar has 10 LEDs
   Base_Delay  : constant := 0.06;       --  fastest speed (middle, in seconds)
   Amplitude   : constant := 0.12;       --  how much slower the LEDs are at the ends (in seconds)

   ---
   --  Range of LEDs connected to the bar
   --
   type LED_Number is range 1 .. LED_Count;

   ---
   --  Array to hold the pre-calculated delay times.
   --  This makes the flowing movement more organic (slower at the ends).
   --
   type Delay_Array_Type is array (LED_Number) of RT.Time_Span;

   ---
   --  Calculate the delay for a given LED so the scanner slows down at the ends.
   --
   --  @param LED  The LED for which the delay should be calculated
   --  @return     The delay as a Time_Span
   --
   function Delay_Time (LED : in LED_Number) return Ada.Real_Time.Time_Span with
      Inline,
      Pure_Function
   is
      Position : constant Float := Float (LED - LED_Number'First)
                                 / Float (LED_Number'Last - LED_Number'First);
      Phase    : constant Float := Position * Num.Pi;                -- 0 → π
      Factor   : constant Float := (1.0 - Math.Sin (Phase)) / 2.0;   -- 0..1..0
   begin
      return RT.To_Time_Span (Duration (Base_Delay + Amplitude * Factor));
   end Delay_Time;

   ---
   --  GPIO pins the LEDs are connected to
   --
   LEDs : constant array (LED_Number) of access RP.GPIO.GPIO_Point :=
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
   --  Pre-calculated delay times (only computed once at elaboration)
   --
   Delay_Times : constant Delay_Array_Type := [for I in LED_Number => Delay_Time (I)];

   ---
   --  Time of the next LED change
   --
   Next : RT.Time := RT.Clock;

begin
   --  Configure all 10 GPIO pins as outputs
   --
   for I in LEDs'Range loop
      LEDs (I).Configure (RP.GPIO.Output);
   end loop;

   loop
      --  Sweep right to left
      --
      for I in LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;

      --  Sweep left to right
      --
      for I in reverse LEDs'Range loop
         LEDs (I).Set;
         Next := @ + Delay_Times (I);
         delay until Next;
         LEDs (I).Clear;
      end loop;
   end loop;
end Cylon_Light_Float;
```

To keep energy consumption low I pre-calculate the ten delay values once at program start. I declared the function with
`Inline` and `Pure_Function` so the compiler has the best chance to optimise it (especially in release mode).

I also used the new Ada 2022 iterated component association to initialise the array:

```ada
   Delay_Times : constant Delay_Array_Type := [for I in LED_Number => Delay_Time (I)];
```

While this looks like syntactic sugar, it has a practical benefit: the array is now clearly `constant`. The optimiser
can take advantage of that, and in theory a perfect compiler could even compute the values at compile time (though the
perfect optimiser still doesn’t exist).

### The little puzzle

I ran into a confusing cascade of error messages while writing this. If you’re an experienced Ada programmer, can you
spot the mistake in the following snippet (without looking at the corrected code above)?

```ada
   LED_Count  : constant := 10;
   type LED_Number is range 1 .. LED_Count;
   type Delay_Array_Type is array (1 .. LED_Count) of RT.Time_Span;
   function Delay_Time (LED : in LED_Number) return Ada.Real_Time.Time_Span;

   Delay_Times : Delay_Array_Type := [for I in LED_Number => Delay_Time (I)];
```

**Answer:**  
`Delay_Array_Type` breaks the chain of strongly-typed declarations. By writing `array (1 .. LED_Count)` the index type
becomes the anonymous universal integer instead of the named subtype `LED_Number`. Universal integer cannot be used as
the index type of an array aggregate in this context, so the compiler complains at the aggregate even though the real
problem is in the type declaration.

The error messages were misleading because they pointed at the aggregate rather than the faulty array type.

## Advantages and disadvantages

The floating-point version of the Cylon light is about 66 KB larger on the Pico and 11 KB larger on the Pico 2. Energy
consumption is similar because the delays are calculated only once, but you can tweak parameters much faster — change a
value, reset the board, `make deploy` and you’re testing again in about 10 seconds once muscle memory kicks in.

For the original Pico, which has no hardware floating-point unit, I will still avoid floating point in the main
tutorials. An extra 66 KB is quite a lot on a small microcontroller. In the good old days the Atari 800 managed with
just a 2 KB floating-point ROM!


[![Cylon Scanner with floating point](20260331_171956.jpeg?fit=640x640 "Cylon Scanner with floating point")](20260331_171956.jpeg)

{{< instagram DWovJf4k396 >}}

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
