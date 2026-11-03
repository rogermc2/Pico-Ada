---
title       : "Chapter 1: Blinking LEDs – Getting Started with Ada on the Raspberry Pi Pico"
description : "My first steps into Ada programming on the Pico: from Jeremy Grosser's classic blink example through explicit pin control to using an external LED, plus thoughts on the elegant (but still experimental) Ravenscar profile."
summary     : "Starting simple with LED blinking in Ada – internal LED, external LED with proper renaming, and a look at why Ravenscar looks so clean (even if it's not quite ready for everyday use yet)."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T16:52:58+0200
date        : 2026-03-12T19:54:14+0100
draft       : false
type        : "page"
layout      : "single"
categories  : ["flashing", "macos", "linux", "windows"]
tags        : ["picotool", "led", "blink", "pico_ada"]
---

| Link                                                                                  | Purpose                                                                 |
|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| {{< icon "dev" >}} [C Tutorial Chapter 1 – LED (Important)](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C/1_LED_%28Important%29.html#) | Freenove's official C version – Chapter 1 introduction to LED control   |
| {{< icon "youtube" >}} [C Tutorial Chapter 2 – LED (Important)](https://www.youtube.com/watch?v=NFH_3oByn0E) | Freenove's C Video description                     |
| {{< icon "dev" >}} [Alire crate](https://alire.ada.dev/crates/pico_ada_c01_blink/) | Alire crate containing the Ada code in this chapter |
| {{< icon "dev" >}} [GNATdoc documentation for this chapter](https://pi-ada-tutorial.sourceforge.io/gnatdoc/pico_ada_doc/) | Automatically generated HTML documentation for the Ada code in this chapter |

## Preparation

Before diving into the Freenove examples, I decided to start with a known-good Ada blink programme written by Jeremy
Grosser. It was the perfect way to verify that my toolchain, hardware, and project setup were working correctly without
the extra complication of porting someone else's code at the same time.

The experience taught me quite a bit – you can read more about the hardware side in [Hardware Reset
Button](/reset-button/) and about streamlining the build in [From Repetitive to Elegant: My Improved Pico Ada
Makefile](/setup_makefile/).

Here is Jeremy's original blink example:

```ada
---
---  Copyright 2021 (C) Jeremy Grosser
---
---  SPDX-License-Identifier: BSD-3-Clause
---
with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

---
--  The Hello_Pico sample from the https://pico-doc.synack.me/ to test basic functionality of the Ada and Pico setup.
--
procedure Blink is
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   Pico.LED.Configure (RP.GPIO.Output);
   RP.Device.Timer.Enable;
   loop
      Pico.LED.Toggle;
      RP.Device.Timer.Delay_Milliseconds (100);
   end loop;
end Blink;
```

If you want to try setting it up yourself, Jeremy's own instructions are excellent and I won't try to improve on them.

| Link                                                                                  | Purpose                                                                 |
|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| {{< icon "dev" >}} [Ada on the Raspberry Pi Pico – Blinking an LED](https://pico-doc.synack.me/#blinking_an_led/) | Jeremy Grosser's clear step-by-step guide to the blink example          |
| {{< icon "github" >}} [Jeremy Grosser's pico_examples – blink folder](https://github.com/JeremyGrosser/pico_examples/tree/master/blink) | Original Ada source code for several Pico blink variations              |

## Chapter 1.1 – Slow, Photograph-friendly Blinking

Sketch_01_1 does essentially the same job as Jeremy's version, but I switched to explicit `.Set` and `.Clear` calls and
lengthened the delay to 1 second. That makes the on/off states much easier to capture in photos.

```ada
pragma License (Modified_Gpl);
pragma Ada_2022;
pragma Extensions_Allowed (On);

with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

---
--  Make an led blinking.
--
procedure Sketch_01_1_Blink is
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   Pico.LED.Configure (RP.GPIO.Output);
   RP.Device.Timer.Enable;

   loop
      Pico.LED.Set;
      RP.Device.Timer.Delay_Milliseconds (1_000);
      Pico.LED.Clear;
      RP.Device.Timer.Delay_Milliseconds (1_000);
   end loop;
end Sketch_01_1_Blink;
```

[![Pi blinking internal LED](20260311_185534.jpeg?fit=640x640 "Pi blinking internal LED")](20260311_185534.jpeg)

{{< instagram DVweV_HE1Yg >}}

| Link                                                                                  | Purpose                                                                 |
|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| {{< icon "dev" >}} [Freenove Tutorial 1.1 – Project: Blink](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C/1_LED_%28Important%29.html#project-blink) | Freenove's matching C project – basic internal LED blink                |
| {{< icon "github" >}} [Freenove GitHub – Sketch_01.1_Blink](https://github.com/Freenove/Freenove_Ultimate_Starter_Kit_for_Raspberry_Pi_Pico/tree/master/C/Sketches/Sketch_01.1_Blink) | Original C source code for Freenove Chapter 1.1                         |

## Chapter 1.2 – External LED with Clean Pin Naming

Freenove's C code uses a `#define` to alias the pin – not very elegant. Ada gives us a much nicer, type-safe
alternative: renaming.

I renamed `Pico.GP15` to simply `LED` so the rest of the code reads cleanly.

```ada
pragma License (Modified_Gpl);
pragma Ada_2022;
pragma Extensions_Allowed (On);

with RP.Device;
with RP.Clock;
with RP.GPIO;
with Pico;

---
--  Make an led blinking.
--
procedure Sketch_01_2_Blink is
   ---
   --  Use GP 15 for the external LED
   --
   LED  : RP.GPIO.GPIO_Point renames Pico.GP15;
begin
   RP.Clock.Initialize (Pico.XOSC_Frequency);
   LED.Configure (RP.GPIO.Output);
   RP.Device.Timer.Enable;

   loop
      LED.Set;
      RP.Device.Timer.Delay_Milliseconds (1_000);
      LED.Clear;
      RP.Device.Timer.Delay_Milliseconds (1_000);
   end loop;
end Sketch_01_2_Blink;
```

[![Pi blinking external LED](20260312_185620.jpeg?fit=640x640 "Pi blinking external LED")](20260312_185620.jpeg)

{{< instagram DVy3lEbExEx >}}

| Link                                                                                  | Purpose                                                                 |
|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| {{< icon "dev" >}} [Freenove Tutorial 1.2 – Project: External LED Blink](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C/1_LED_%28Important%29.html#id1) | Freenove's C version using an external LED on GP15                      |
| {{< icon "dev" >}} [Alire crate](https://alire.ada.dev/crates/pico_ada_c01_blink/) | Alire crate containing the Ada code in this chapter |
| {{< icon "github" >}} [Freenove GitHub – Sketch_01.2_Blink](https://github.com/Freenove/Freenove_Ultimate_Starter_Kit_for_Raspberry_Pi_Pico/tree/master/C/Sketches/Sketch_01.2_Blink) | Original C source code for Freenove Chapter 1.2                         |

## A Quick Look at Ravenscar

Finally, I wanted to try the Ravenscar profile. Ravenscar is a restricted subset of Ada's tasking model, designed for
high-integrity and hard real-time systems where you need predictable scheduling and analysability without the full (and
heavier) tasking runtime.

**Trivia:** The profile is named after the small Yorkshire coastal village of Ravenscar, where the 8th International
Real-Time Ada Workshop (IRTAW-8) took place in 1997. That meeting produced the initial definition of the restricted
tasking model we still use today.

Jeremy has a very elegant Ravenscar version of blink that uses the standard `delay` statement:

```ada
--
--  Copyright 2021 (C) Jeremy Grosser
--
--  SPDX-License-Identifier: BSD-3-Clause
--
with RP.GPIO;
with Pico;

procedure Blink is
begin
   Pico.LED.Configure (RP.GPIO.Output);
   loop
      Pico.LED.Toggle;
      delay 0.1;
   end loop;
end Blink;
```

It really is beautifully concise – arguably cleaner than the equivalent Python code.

However… this only works when you use a Ravenscar-compatible runtime.

The older (but still very usable) approach is Jeremy's `ravenscar_full_rp2040` Alire crate. It provides tasking support
and plays reasonably nicely with `rp2040_hal` drivers – you just need to disable the conflicting startup code in
`alire.toml` with `rp2040_hal.Use_Startup = false` and remove some linker switches from your project file.

The newer `light-tasking-rpi-pico` (and `-smp`) runtimes that are starting to appear directly in the GNAT arm-eabi
toolchain look promising – they give you `delay` and protected objects without external crates. Unfortunately, I quickly
discovered you can't just drop them into a project that uses `pico_bsp` or the standard `rp2040_hal` setup; the runtimes
supply their own boot code and linker scripts, leading to immediate conflicts (linker errors galore). It's effectively a
dead end unless you're willing to forgo the BSP and HAL or heavily reconfigure things.

Ravenscar support on the Pico is still very much experimental / in transition. For now, I'm staying with the standard
non-tasking runtime so I can focus on the electronics rather than fighting the toolchain. The explicit timer calls are a
bit more verbose, but they're reliable, easy to reason about, and just work with the examples I'm porting.

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
