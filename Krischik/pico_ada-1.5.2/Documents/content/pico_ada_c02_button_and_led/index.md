---
title       : "Chapter 2 – Button & LED"
description : "Controlling an LED with a button on the Raspberry Pi Pico using Ada – two simple but useful interaction examples."
summary     : "In this chapter I combine a push button with an LED. We start with basic on/off control, then move to a toggle-style table lamp with software debounce."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T16:52:58+0200
date        : 2026-03-20T17:24:11+0100
draft       : false
type        : "page"
layout      : "single"
categories  : ["button", "macos", "linux", "windows", "ravenscar"]
tags        : ["button", "led", "debounce", "toggle", "pico_ada"]
---

| Link                                                                                  | Purpose                                                                 |
|---------------------------------------------------------------------------------------|-------------------------------------------------------------------------|
| {{< icon "dev" >}} [C Tutorial Chapter 2 – Button & LED](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C/2_Button_%26_LED.html) | Freenove's official C version – Chapter 2 Button & LED                  |
| {{< icon "youtube" >}} [C Tutorial Chapter 2 – Button & LED](https://www.youtube.com/watch?v=8DObp2mcwgw) | Freenove's official video description                                   |
| {{< icon "dev" >}} [Alire crate](https://alire.ada.dev/crates/pico_ada_c02_button_and_led/) | Alire crate containing the Ada code in this chapter                     |
| {{< icon "dev" >}} [GNATdoc documentation for this chapter](https://pi-ada-tutorial.sourceforge.io/gnatdoc/pico_ada_doc/) | Automatically generated HTML documentation for the Ada code in this chapter |

In Chapter 2 I add a push button to the mix and make the LED respond to it. Hardware-wise, we introduce a proper 3.3 V
rail for the button pull-up (or pull-down – depending on wiring).

I’m aiming for a 5 V battery supply in future setups so I can power via battery and USB simultaneously without
back-feeding current. A Schottky diode protects the Pico from reverse current, but I’m still double-checking the other
direction.

I’ve also started packaging each chapter as an Alire crate – they’re moderated, so it might take a little while for them
to appear, but they make fetching and building the examples much easier.

Both sketches worked first time, which was a nice change after some of the runtime experiments in Chapter 1!

## sketch_02_1_button_and_led

This is a fairly direct port of the first C example. The button is wired active-low (pressed = low), so I inverted the
logic compared to the C version to make the `if` read more naturally.

I also added a short delay in the loop to avoid a tight busy-wait – better for power and responsiveness.

```ada
---
--  Switch LED sample from Chapter 2.1 (Freenove C Tutorial Chapter 2)
--
procedure Sketch_02_1_Button_And_Led with
   No_Return
is
   --  External LED on GP15
   LED    : RP.GPIO.GPIO_Point renames Pico.GP15;
   --  Button on GP13
   Button : RP.GPIO.GPIO_Point renames Pico.GP13;
begin
   LED.Configure (RP.GPIO.Output);
   Button.Configure (RP.GPIO.Input);

   loop
      --  Button pressed → low (false); released → high (true)
      if Button.Get then
         LED.Clear;   --  off when released
      else
         LED.Set;     --  on when pressed
      end if;

      delay 0.02;  --  gentle loop rate
   end loop;
end Sketch_02_1_Button_And_Led;
```

[![Button controlling external LED](20260320_164627.jpeg?fit=640x640 "Button controlling external LED")](20260320_164627.jpeg)

{{< instagram DWHdIIPE7XZ >}}

## sketch_02_2_table_lamp

The second example turns the setup into a proper table lamp: press once to toggle the LED on/off, with simple software
debounce and wait-for-release logic.

Ada’s built-in `Toggle` method saves us writing extra code. I added a `not` on the button read to match the active-low
wiring.

Added a bit more contract style (`No_Return`) and kept the gentle delays.

```ada
pragma License (Modified_Gpl);
pragma Ada_2022;
pragma Extensions_Allowed (On);

with RP.GPIO;
with Pico;

---
--  Table Lamp sample from Chapter 2.2 (Freenove C Tutorial Chapter 2)
--
procedure Sketch_02_2_Table_Lamp with
   No_Return
is
   --  External LED on GP15
   LED    : RP.GPIO.GPIO_Point renames Pico.GP15;
   --  Button on GP13
   Button : RP.GPIO.GPIO_Point renames Pico.GP13;
begin
   LED.Configure (RP.GPIO.Output);
   Button.Configure (RP.GPIO.Input);

   loop
      --  Button pressed (low)
      if not Button.Get then
         --  Simple debounce
         delay 0.02;
         if not Button.Get then
            LED.Toggle;
         end if;

         --  Wait until button is released
         while not Button.Get loop
            delay 0.02;
         end loop;
      end if;

      delay 0.02;  --  avoid busy loop
   end loop;
end Sketch_02_2_Table_Lamp;
```

[![Table lamp toggle demo](20260320_165209.jpeg?fit=640x640 "Table lamp toggle demo")](20260320_165209.jpeg)

{{< instagram DWHddSFE26K >}}

That’s Chapter 2 done. It’s a small step up from plain blinking, but it introduces real input handling and debounce –
essential for anything interactive.

Next chapter should bring something new. Admit it — you've always fancied building your own red Cylon eye scanner. I'll
get cracking on it soon!

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
