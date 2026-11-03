---
title	    : "Hardware Reset Button"
description : "Adding a Hardware Reset Button – Goodbye USB Plug Wrestling"
summary     : "Adding a Hardware Reset Button – Goodbye USB Plug Wrestling"
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T16:53:18+0200
date        : 2026-03-09T16:42:41+0100
draft	    : false
type	    : "page"
layout	    : "single"
categories  : ["hardware", "breadboard", "side-quest"]
tags	    : ["reset"]
---

I have to admit it: for the first few hours of playing with the Raspberry Pi Pico I must have plugged and unplugged that
blessed micro-USB cable at least twenty times. Every time I wanted to flash a new `.uf2` file it was the same ritual —
hold BOOTSEL, pray the timing was right, yank the cable, plug it back in, hope the drive appeared. It got old very
quickly indeed.

So when [Grok](https://grok.com) [¹](#1) strongly recommended adding a hardware reset button, I didn’t need much
convincing. Grok mentioned that Raspberry Pi themselves suggest exactly this for anyone doing serious breadboard
development. The improvement is immediate and dramatic.

### What the reset button actually does

- A quick press → normal hardware reset (program restarts from the beginning)
- The clever bit: hold the new reset button + hold the onboard BOOTSEL button → release reset first → release BOOTSEL →
  the Pico enters mass-storage mode and the `RPI-RP2` drive pops up again — **no cable touching required**.

### Parts & wiring (supposedly takes 30 seconds…)

You need:

- 1 × momentary push-button.
- 2 × jumper wires (or just solid-core wire if you’re feeling minimalist)

Connect the button between:

- **RUN** pin (physical pin 30 on the Pico)
- any **GND** pin

That’s it. No pull-up resistor, no fancy circuitry — the RP2040 already has an internal pull-up on the RUN pin.

I chose **GND on pin 18** because it was conveniently close to the button and I placed the Pico at the very edge of the
breadboard. That small decision turned out to be important: by putting the Pico right at the side, the USB cable hangs
off the table edge and doesn’t eat any valuable breadboard real estate. More room for LEDs, resistors, buttons, sensors…
you name it.

### Funny (but true) confession

The wiring itself took maybe twenty seconds once I had decided on the button. Overall it was a little longer rummaging
through the [Freenove Ultimate Starter Kit for Raspberry Pi Pico](https://docs.freenove.com/projects/fnk0058/en/latest/)
box trying to choose which button to use.

That kit contains *loads* of different switches — big chunky ones, tiny tactile ones, latching ones, even coloured ones.
I stood there like I was buying a house, weighing up pros and cons. As well as opening several tiny plastic bags. In the
end I went for one of the small black micro tactile buttons. Why? Because it’s exactly the same family of buttons the
[Bean Eater 6502 computer kit](https://eater.net/6502) uses, and I quite like the continuity. Plus it feels nice under
the finger, doesn’t wobble and uses very little place on the breadboard.

### The result – worth every second of button indecision

Here’s what my setup looks like right now:

[![Pi with hardware reset button](20260307_194927.jpeg?fit=640x640 "Pi with hardware reset button")](20260307_194927.jpeg)

The Pico sits neatly at the edge, USB cable out of the way, reset button within easy thumb reach. Flashing is now:

1. Hold BOOTSEL on the Pico
2. Hold my new reset button
3. Release reset
4. Release BOOTSEL
5. Copy the uf2 file. I have a `Makefile` prepared to build and copy in one go.

Done. No cable dance. No desk acrobatics.

Even better: the breadboard adds noticeable mass and stability. The lonely little Pico-on-a-desk used to slide around
whenever I brushed it. Now the whole arrangement feels like a proper (if tiny) electronics project. Psychologically
satisfying.

If you’re just starting with the Pico and you’re already annoyed by the USB ritual — do yourself a favour and solder or
jumper in that reset button today. It’s one of those small changes that makes every following hour noticeably more
pleasant.

Happy breadboarding!  
Martin

-----

#### 1
Grok is quite helpful as Grok not only knows all about Raspberry Pi and help with Python and C. Grok can also help with
Ada and at a very high level including Design by Contract and SPARK. 

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
