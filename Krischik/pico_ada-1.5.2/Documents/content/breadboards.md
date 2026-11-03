---
title       : "Side Quest: Breadboards – Why Cheap Ones Just Don’t Cut It"
description : "A cheerful rant about upgrading from wobbly Freenove breadboards to proper BusBoard BB830s for my Raspberry Pi Pico Ada tutorials. Solid hardware means better videos, fewer headaches, and happier hands-on coding!"
summary     : "Discover why I’m switching breadboards mid-project – from loose buttons ruining shots to rock-solid BusBoard reliability. Plus a peek at my new transparent setup and some exciting 6502 bits ordered on the side."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-03-23T19:59:00+0100
date        : 2026-03-23T19:32:38+0100
draft       : false
type	    : "page"
layout	    : "single"
categories  : ["hardware", "side-quest"]
tags        : ["breadboards", "busboard"]
---

One quick aside before we dive into the LED bar: I’m not thrilled with my current breadboard. The button doesn’t sit as
firmly as I’d like – it wobbles a bit and the connection is iffy, leading to falsely reported actuations.

At that point I remembered from back in the day when I made my [MOS-6502 and Atari 8-bit
Tutorials](https://tutorial-6502.sourceforge.io/index.html) that [Ben Eater](https://eater.net/) had something to say
about [breadboard quality](https://eater.net/breadboards).

He tested loads of breadboards before settling on the high-quality [BusBoard Prototype
Systems](https://www.busboard.com/) BB830 ones for his kits. Turns out they’re not all the same at all! Cheaper ones
often have weaker contacts that don’t grip components reliably, leading to exactly the sort of loose button issues I’m
seeing. The quality of those contacts really makes a difference here.

So I’ve bitten the bullet and ordered a proper BusBoard BB830 from [Mouser](https://www.mouser.ch). Yes, it’s easily a
factor of ten[¹](#1) more expensive than the board that came with the [Freenove
Kit](https://de.aliexpress.com/item/1005004336772445.html). I can’t fault Freenove for it – adding a BusBoard BB830 to
the kit would have made the breadboard the most expensive component, even pricier than the Raspberry Pi Pico included in
some variants of the kit.

But wobbly buttons don’t make recording videos any easier. One hand holds the phone while the other presses the button…
which promptly jumps out of the breadboard and ruins the shot. And because I film outside for better light, I might even
lose the button for good on the lawn!

From my experience with Ben Eater’s [6502 Kit](https://eater.net/6502) I know the contacts on a BusBoard really hold
things tight. I won’t risk fishing lost components out of the grass. Solid hardware means fewer headaches and better
tutorials. Next chapter’s LED bar will still use the old board – the new one takes a few days to arrive from the USA.

Speaking of international orders: for someone in Switzerland the real advantage of Mouser is that they take care of the
import tax themselves and don’t rely on United Parcel Service or FedEx for handling. Both carriers slap on exorbitant
handling charges that they pass straight on to the receiver – much higher than the US Postal Service, which lets Swiss
Post manage the import. Swiss Post does a cracking job, but Mouser sorting it all without any extra fee is even better.

I’ve gone for the transparent BB830T this time – I hope it’ll look rather smart on camera and let you see how the wires
snake underneath. For the Pico’s 3.3 V logic I’ve also ordered extra power rails (sadly not transparent). I’ll make the
best of it by using the clear board for 5 V and the opaque one for 3.3 V.

I also ordered a few bits for other projects: a WD65C816 (plus bus driver), a WD65C51 (plus RS232 driver), and a handful
of NAND, AND and NOT gates for some advanced address-decoder logic. When my 6502 breadboard computer finally gets
Microsoft BASIC we’ll need all the RAM we can get!

-----
#### 1
That’s ten times for non-nerds, and it really is a factor of ten. A proper BusBoard BB830 costs 8.50 Francs at Mouser.ch
while the cheapest AliExpress generics go for just 80 Rappen.

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
