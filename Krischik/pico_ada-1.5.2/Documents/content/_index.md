---
title	    : "PI Ada Tutorial"
description : "Raspberry Pi Pico"
summary     : "How to use Ada with the Raspberry Pi Pico."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T18:39:37+0200
date	    : 2026-03-08T14:30:00+0100
draft	    : false
type	    : "list"
layout	    : "list"
categories  : ["project", "hardware"]
tags	    : ["alire", "freenove"]
---

You have been away for a while working for the paying customers. Anyway I have prepared the draft for the debug side quest. That was quite a lot and needs checking for spelling, wording etc. Since it's very technical improving wording is indeed important and some code and json samples need more detailed explanation for the reader. I hope you are not to tired from the paying customers.

The Instagram links are only placeholder. I have prepared two videos which I still have to upload.

## My Journey: Bringing Freenove Experiments to Ada on the Raspberry Pi Pico

I have always been drawn to **Ada** because of its focus on safety, reliability and catching mistakes early. So I
thought — why not take the brilliant [Freenove Ultimate Starter Kit for Raspberry Pi
Pico](https://docs.freenove.com/projects/fnk0058/en/latest/) and rewrite every single experiment in Ada instead of the
usual Python or C?

The kit is fantastic value: you get 220+ components and 119 guided projects covering GPIO, sensors, displays, motors,
keypads — just about everything you need to really understand the Pico. You can still pick it up for under $50 from
places like [AliExpress](https://de.aliexpress.com/item/1005004336772445.html).

I’m working through the lessons one by one, writing clean, idiomatic Ada code (and using Ravenscar where real-time
behaviour matters). Along the way I share build notes, little ZShell helpers for flashing, things that tripped me up,
and the occasional extra experiment that felt fun or useful.

If you want to follow along — or just borrow bits for your own projects — everything lives in the [Pi Ada Tutorial
repository](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/).

## How the Project is Organised

I follow the structure of the official Freenove **C** tutorial quite closely so you can easily compare the two
languages.

Each chapter gets its own Alire crate. The name usually starts with the chapter number followed by a short description —
for example:

- `pico_ada_c01_led` → Chapter 1 experiments with LEDs
- `pico_ada_c05_button` → Chapter 5 button & debounce work

Some chapters in the original kit contain several small programs (e.g. Chapter 1 has both the internal Pico LED and an
external LED). In those cases I usually create multiple executables inside the same crate.

Occasionally I also borrow well-known working examples from [Ada on the Raspberry Pi Pico](https://pico-doc.synack.me/)
— the very first “Blink” program from Jeremy Grosser was my sanity check before I started changing things. And sometimes
I add my own variations, especially when I want to try Ravenscar tasks for proper real-time blinking or timed sequences.

## My Development Directory Setup

One thing that makes my life much easier is **git worktrees** — I wish I had discovered them years ago!

I keep the main clone in a folder called `develop`:

```
Pi-Ada-Tutorial/
└── develop/		   ← git clone here (my active development branch)
```

From there I create extra worktrees whenever I need them:

```
Pi-Ada-Tutorial/
├── develop/		   ← main working copy
├── release/		   ← worktree for polished, stable versions
└── feature-ravenscar-led/ ← worktree for experimenting with Ravenscar
```

This way I can switch contexts very quickly without constantly stashing or switching branches.

For quick reference I also cloned two very helpful external repositories **inside** the same parent folder:

- `Freenove_Ultimate_Starter_Kit_for_Raspberry_Pi_Pico/` → the official C/MicroPython code
- `pico_examples/` → Jeremy Grosser’s Ada examples

Having them side-by-side means I can glance at the original C or a known-good Ada version while I’m writing.

## Chapters

These are the hands-on Ada ports of the Freenove experiments I’ve completed so far. I’m calling the core tutorial
sequence the **Main Quest** — the straight path through the kit’s lessons, rewritten in Ada with my notes and
improvements.

### Main Quest – Core Freenove Experiments in Ada

| Link							    | What it covers								    |
|-----------------------------------------------------------|-------------------------------------------------------------------------------|
| [Chapter 1 — Blinking LEDs](pico_ada_c02_button_and_led)  | Getting started with Ada on the Raspberry Pi Pico				    |
| [Chapter 1 — Reloaded](pico_ada_c01_blink_lt)		    | Dual-core light tasking – blinking LEDs on both cores			    |
| [Chapter 2 — Button & LED](pico_ada_c02_button_and_led)   | From basic on/off control to a toggle-style table lamp			    |
| [Chapter 3 — “Cylon” LED Bar](pico_ada_c03_led_bar)	    | Building a smooth flowing LED bar including a proper menacing Cylon scanner   |
| [Chapter 4 — Analog & PWM](pico_ada_c04_pwm/)		    | Building smooth breathing LEDs and flowing light bars with hardware PWM	    |
| [Chapter 5 — RGBLED](pico_ada_c05_rgb/)		    | Controlling an RGB LED with PWM						    |


### Side Quests – Handy Hardware & Setup Tips

The **Side Quests** are the little detours and hardware/setup improvements that made my life easier (or saved me from
losing buttons in the grass). They’re not tied to a specific Freenove chapter but are very useful in practice.

| Link						    | What it’s about										|
|---------------------------------------------------|-------------------------------------------------------------------------------------------|
| [Configuring Passwordless sudo](setup_sudoers)    | Configuring password less sudo for picotool (…and why I gave up on macOS)			|
| [Hardware Reset Button](reset-button)		    | Adding a hardware reset button – goodbye USB plug wrestling				|
| [Breadboards](breadboards)			    | Not all breadboards are the same — upgrading to proper ones				|
| [Breadboards Arrived](breadboards-arrived)	    | The BusBoard BB1660T breadboards finally landed						|
| [Raspberry Pi Pico 2 W](pico2)		    | How-To use the **Raspberry Pi Pico 2 W** instead of the **Raspberry Pi Pico**		|
| [Floating point arithmetic](float)		    | Floating point for the **Raspberry Pi Pico** now fixed.					|
| [Debugging with Rasberry Pi Pico Probe](debug)    | Setting up a reliable debug environment for the Raspberry Pi Pico and Pico 2 with Ada.	|

## Useful Resources

Here are the sites I keep open almost all the time:

| Link																						    | What it’s for										    |
|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------|
| {{< icon "sourceforge" >}} [Pi Ada Tutorial Project](https://sourceforge.net/projects/pi-ada-tutorial)									    | Home of the whole project									|
| {{< icon "git" >}}	     [Repository (develop branch)](https://sourceforge.net/p/pi-ada-tutorial/code/ci/develop/tree/)							    | Current code & history									|
| {{< icon "dev" >}}	     [Ada on the Raspberry Pi Pico](https://pico-doc.synack.me/)											    | Excellent Ada-specific Pico documentation							|
| {{< icon "github" >}}      [Jeremy Grosser pico_examples](https://github.com/JeremyGrosser/pico_examples)									    | High-quality Ada Pico examples								|
| {{< icon "globe" >}}	     [Freenove Pico Kit main page](https://docs.freenove.com/projects/fnk0058/en/latest/)								    | Kit overview & purchase links								|
| {{< icon "dev" >}}	     [Freenove C Tutorial](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C.html)							    | The original experiments I’m porting							|
| {{< icon "github" >}}      [Freenove GitHub repo](https://github.com/Freenove/Freenove_Ultimate_Starter_Kit_for_Raspberry_Pi_Pico)						    | Original kit code										|
| {{< icon "github" >}}      [Ada Lang Rraspberry Pi Pico Gitter](https://app.gitter.im/#/room/#ada-lang_raspberrypi-pico:gitter.im)						    | Forum	about Embedded Ada programming							|
| {{< icon "dev" >}}	     [GNATdoc Rasberry Pi Pico](https://pi-ada-tutorial.sourceforge.io/gnatdoc/pico_ada_doc/)								    | Automatically generated HTML documentation for the Ada code for the Raspberry Pi Pico	|
| {{< icon "dev" >}}	     [GNATdoc Rasberry Pi Pico 2](https://pi-ada-tutorial.sourceforge.io/gnatdoc/pico2_ada_doc/)							    | Automatically generated HTML documentation for the Ada code for the Raspberry Pi Pico 2	|
| {{< icon "dev" >}}	     [Develop and Debug Raspberry Pi Pico on macOS Big Sur](https://andrejacobs.org/b24/electronics/develop-and-debug-raspberry-pi-pico-on-macos-big-sur/)  | Debug set-up without with two Raspberry Pi Pico 1 instead of a Raspberry Pi Pico Probe.	|

That’s the current lay of the land. Next posts will dive into individual chapters with code, photos of the breadboard,
and notes on what surprised me when moving from C to Ada.

Happy hacking — and do get in touch if you spot anything confusing or have suggestions!

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
