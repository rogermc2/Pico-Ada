---
title       : "Side Quest Update: The Breadboards Have Arrived!"
description : "The BusBoard BB830T breadboards finally landed from Mouser.ch – and the quality difference is night and day. Better feel, perfect grip on everything from Pico pins to tiny button legs. I’ve even set up spare boards for the Pico 2W. My videos (and patience) just got a big upgrade."
summary     : "Unboxing the new transparent BusBoard BB830T, side-by-side comparison with the Freenove board, a quick nerd-out on fingertip sensitivity, and how I prepared identical setups for both my Raspberry Pi Pico and Pico 2W. Plus a note on why Ada support for the Pico 2W is still a bit flaky."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-04-10T16:50:58+0200
date        : 2026-03-28T18:30:00+0100
draft       : false
type	    : "page"
layout	    : "single"
categories  : ["hardware", "side-quest"]
tags        : ["breadboards", "busboard"]
---

This is a follow-up to my earlier post [“Breadboards”](https://pi-ada-tutorial.sourceforge.io/breadboards/) where I
first mentioned the wobbly buttons on the breadboard that came with the Freenove kit. I really like the Freenove
Ultimate Starter Kit in general — it’s fantastic value and their tutorial is very well made. The only weak point is the
breadboard, but I can’t fault them for that. A proper BusBoard would have been significantly more expensive and would
have become the most expensive component in the whole kit — even more than the servos, the LCD display, or the Pico
itself.

## The Breadboards Have Arrived!

First things first: a huge thank-you to [Mouser.ch](https://www.mouser.ch) for the impressively fast delivery. The
package arrived in under a week – all the way from the USA to Switzerland. That’s seriously impressive international
shipping. Kudos!

Here’s the parcel straight out of the post box – everything carefully packaged.

[![Mouser parcel containing the new BusBoard breadboards](20260326_185220.jpeg?fit=640x640 "Mouser parcel – fast
delivery from the USA to Switzerland")](20260326_185220.jpeg)

When you pull the **BusBoard BB830T** out of the anti-static bag you immediately feel the difference in quality. The
transparent version has a lovely, solid haptic that just screams “premium”.

And yes, I’m going to nerd out for a moment on human anatomy. Our fingertips are ridiculously sensitive thanks to
mechanoreceptors that can detect surface variations as tiny as 13 nanometres. That’s the sort of resolution where, if
your finger were the size of the Earth, you could feel the difference between a smooth road and one with a single grain
of sand on it. So when I say the BusBoard feels noticeably better, my fingers really can tell!

Here are the boards fresh out of the bag – the transparent one on the left already looks and feels premium next to the
old Freenove board.

[![BusBoard BB830T still in the anti-static bag](20260326_185345.jpeg?fit=640x640 "BusBoard :BB830T still in the
anti-static bag")](20260326_185345.jpeg)

But the important part is how it performs in real use – and that comes down: to the contacts.

It’s difficult to explain in words, but here’s the magic: the BusBoard makes it much easier to push or pull the pin
headers of the Pico in and out. Those headers are basically the maximum girth you’ll ever plug into a breadboard. At the
same time, it grips the short, flimsy legs of the micro push-buttons firmly – the absolute minimum you can insert. That
perfect balance is exactly the “springiness” Ben Eater talks about in his breadboard tests.

For comparison, with the breadboard that came in the Freenove kit:
- The Pico headers barely went in at all.
- Once they were seated you practically needed a plastic pry tool to get them out again.
- The micro buttons just fell out the moment you looked at them sideways.

I already knew the BusBoard boards were better from my old 6502 project, but having the cheap one and the good one
sitting side-by-side really drives the difference home. The contacts on the BusBoard are visibly tighter, more even, and
just… happier to do their job.

### Spare Boards and the Pico 2W Setup

Because I now have a couple of spare BB830T boards, I went ahead and prepared the exact same base setup on a
second board for my **Raspberry Pi Pico 2W**.

I bought one plain Pico (maximum compatibility with existing Ada code and libraries) and one Pico 2W (maximum features –
faster cores, more RAM, more flash, and wireless). As expected, Ada support for the RP2350-based Pico 2W is still a bit
flaky in early 2026. Some things work beautifully, but Ravenscar tasking, certain runtime features, and toolchain
integration need a few extra tweaks. Nothing dramatic, but enough that I’m glad I have both boards ready.

Here are the two finished setups side by side:

[![Pico on new transparent BusBoard BB830T](20260327_173021.jpeg?fit=640x640 "Pico on new transparent BusBoard
BB830T")](20260327_173021.jpeg)
[![Pico 2W on new transparent BusBoard BB830T](20260327_172751.jpeg?fit=640x640 "Pico 2W on new transparent BusBoard
BB830T")](20260327_172751.jpeg)

If things ever get tight on a single BB830T, I can simply click on another board – BusBoard even sells the matching
**BB1660T** (basically two BB830s joined together) for bigger projects. Perfect!

[![Pico on new transparent BusBoard BB1660T](20260327_172941.jpeg?fit=640x640 "Pico on new transparent BusBoard
BB1660T")](20260327_172941.jpeg)
[![Pico 2W on new transparent BusBoard BB1660T](20260327_172805.jpeg?fit=640x640 "Pico 2W on new transparent BusBoard
BB1660T")](20260327_172805.jpeg)

I’ve already rebuilt the current Cylon light circuit on the new transparent board for the original Pico. The reset
button now sits rock-solid, the Pico clicks in and out smoothly, and filming the next chapter just became a lot less
stressful – no more chasing runaway components across the lawn!

All in all, money very well spent. Solid hardware really does translate into fewer headaches and better tutorials.

Next up: back to the Main Quest and that LED bar experiment – now with breadboards that behave themselves on both Pico
and Pico 2W!

Happy hacking (and happy inserting)!

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
