---
title       : "Configuring Passwordless sudo for picotool"
description : "Configuring Passwordless sudo for picotool (…and why I gave up on macOS)"
summary     : "How I tried (and failed) to set up passwordless picotool flashing on macOS — and what actually works better."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-03-09T17:55:07+0100
date        : 2026-03-09T16:20:00+0100
draft       : false
type	    : "page"
layout	    : "single"
categories  : ["flashing", "side-quest", "macos", "linux", "security"]
tags        : ["picotool", "sudoers", "uf2", "homebrew"]
---

When I first started flashing `.uf2` files to the Raspberry Pi Pico I quickly
got tired of typing my password every single time I ran `picotool load`.  I
wanted a smooth workflow — especially once I started writing little build
scripts in ZShell. So I decided to set up a nice, secure passwordless `sudo`
rule just for `picotool`.

I spent quite a while thinking about how to do it properly. I didn’t want some
wide-open `NOPASSWD: ALL` nonsense. So I went for the belt-and-braces approach:

- full absolute path to `/opt/homebrew/bin/picotool` (no PATH games)
- restrict to the `load` subcommand only
- only allow files matching `bin/*.uf2`
- **and** lock it down with the SHA-256 digest of the binary itself

That last bit was the clever part — even on my private Mac, if someone (or
something) ever replaced the `picotool` binary, `sudo` would refuse to run it.
Proper defence in depth.

### Step 1 – Grab the digest

I ran this in zsh:

```zsh
shasum -a 256 /opt/homebrew/bin/picotool | awk '{print $1}'
```

Copied the long hex string.

### Step 2 – Edit sudoers the safe way

```zsh
sudo visudo -f /etc/sudoers.d/30-martin-picotool
```

Then I pasted this (with my real digest, of course):

```sudoers
# Allow user 'martin' to flash Raspberry Pi Pico UF2 files without password
# Ada/Pi tutorial – locked down with SHA-256 digest
# Only load + bin/*.uf2 is permitted

Cmnd_Alias PICO_FLASH = sha256:0123456789abcdef... /opt/homebrew/bin/picotool load bin/*.uf2

martin ALL=(ALL) NOPASSWD: PICO_FLASH
```

Saved with `:wq`. `visudo` checked the syntax — all good.

### Step 3 – The moment of truth

I went back to my project folder and tried:

```zsh
sudo picotool load bin/blink.uf2
```

Eveything looked ok: No password prompt, progress bar showed and no
error message. However, no file appeared on the psydo drive. 

I tried again with `-v`. Same thing just more output.

Then I ran:

```zsh
picotool info -a
```

That worked fine — the Pico was detected when in BOOTSEL mode. But any command
that actually *writes* (load, reboot -f, etc.) just failed with any indication.

After a bit of head-scratching and some debugging (and yes, a quick chat with
Grok), the penny dropped: It must be **macOS security**. If I'm wrong do tell
me.

Even though `picotool` is signed and comes from Homebrew, recent macOS versions
(especially Ventura and later) have tightened USB device access via TCC /
libusb / endpoint security.  When `picotool` tries to open the raw USB bulk
endpoints to talk to the RP2040 bootloader, macOS says “nope” and does nothing
— and it doesn't matter if you use `sudo` or not.

### The better way (and the one I now use every day)

I remembered something Ben Eater does in his 6502 videos — he doesn’t hide the
dead ends. He shows what didn’t work, why, and what actually solved the
problem.  So here’s mine: on macOS, **just use copy**.

```zsh
cp bin/blink.uf2 /Volumes/RPI-RP2/ && sync
```

It’s dead simple:

- Put the Pico into BOOTSEL mode (RESET button + BOOTSEL button → release RESET first)
- The `RPI-RP2` volume appears
- Copy the file
- `sync` makes sure it’s fully written before the Pico reboots

No `picotool`, no `sudo`, no Homebrew dependencies, no permission fights.  
It’s what most Pico users on macOS end up doing anyway — and it’s rock solid.

Only drawback is the “Disk not ejected properly” message but you get that
message anyway as the pico self ejects.

I still keep the `sudoers` file around (just commented out) in case I ever need
it on Linux. But for my daily workflow on this MacBook, `cp` wins hands down.

### What I learned

- Digests in `sudoers` are brilliant security — but they don’t help when the
  tool itself is blocked by the OS.
- Sometimes the simplest method (mass storage copy) is also the most reliable.
- Documenting what *didn’t* work is useful — someone else will hit the same
  wall and be grateful they’re not alone.

Next time I’ll show you how I scripted the whole build → flash cycle using only
`cp` and my reset button. No more button mashing required.

Happy flashing — and don’t be afraid to share your own dead ends.  
Martin

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
