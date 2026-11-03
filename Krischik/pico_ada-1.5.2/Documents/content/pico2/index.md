---
title       : "Side Quest: Raspberry Pi Pico 2 W"
description : "How to use the Raspberry Pi Pico 2 W instead of the original Raspberry Pi Pico in the Ada tutorials"
summary     : "How to adapt the existing Ada projects for the newer Raspberry Pi Pico 2 W — a quick side quest with all the necessary changes explained"
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-03-30T20:35:52+0200
date        : 2026-03-30T18:44:57+0200
draft       : false
type        : "page"
layout      : "single"
categories  : ["hardware", "side-quest", "pico-2w", "pico", "pico-w"]
tags        : ["makefile", "alire", "gvim"]
---

Now that I finally have enough [breadboards](breadboards-arrived), I have set up my **Raspberry Pi Pico 2 W** as well.
This is still highly experimental — you will need to fetch the latest code directly from the git repositories.

## What doesn't work

First, a quick note on what does **not** work yet:

1. The internal LED. This also applies to the original **Raspberry Pi Pico W**. The internal LED is connected to the
   WiFi module, and the binding for the WiFi module is still very experimental. Fortunately the Freenove Ultimate
   Starter Kit contains plenty of external LEDs, so I simply use those instead. (I have switched to using **two** external
   LEDs for the Pico 2 W examples.)
2. The `pico_bsp` crate. Luckily we only need the main package from it, so I have copied `pico.ads` directly into our
   project. My fingers are itching to find a cleaner long-term solution. Because of this I have not created a separate
   `pico_ada_c01_blink` crate — we now use the light tasking runtime for all Pico 2 W projects. The light tasking runtime
   is better in every respect anyway.
3. You cannot add Alire crates that contain a `[[pins]]` section to the main repository, as all `[[pins]]` entries are
   removed when preparing the pull request. Therefore, if you want to try the Pico 2 W examples, you need to download
   the full repository from https://sourceforge.net/projects/pi-ada-tutorial/files/Sources/ or clone it.

{{< instagram DWhQPJIE8oi >}}

## What needs changing

The good news is that almost no code changes are required. The only modification you may want to make is to replace any
reference to the internal LED with an external LED.

All other changes live in the project files. I have created new directories by copying the original `pico_ada_` ones and
renaming them:

* `pico_ada_c01_blink_lt`       → `pico2_ada_c01_blink_lt`
* `pico_ada_c02_button_and_led` → `pico2_ada_c02_button_and_led`
* `pico_ada_c03_led_bar`        → `pico2_ada_c03_led_bar`

Don’t forget to rename the GNAT project file (`.gpr`) inside each directory so that it matches the new directory name.

### GNUmakefile

A simple search-and-replace is all you need. If you use **GVim** (as I do), just run these three commands:

```vim
:% substitute /\CPico_/Pico2_/ge
:% substitute /\Cpico_/pico2_/ge
:% substitute /\CRPI-RP2/RP2350/ge
```

If you are not using Vim, the three substitutions do the following:

- Replace every occurrence of “Pico” with “Pico2”, preserving the original upper/lower case.
- Replace every occurrence of “pico” with “pico2”, preserving the original upper/lower case.
- Replace the board identifier `RPI-RP2` with `RP2350`.

### GNAT project file (*.gpr)

Again, a quick search-and-replace:

```vim
:% substitute /\CPico_/Pico2_/ge
:% substitute /\Cpico_/pico2_/ge
```

For non-Vim users: simply replace every “Pico” with “Pico2” while keeping the original case.

### Alire crate description (alire.toml)

This file needs a few more changes. Here is a plain-English step-by-step guide for everyone:

1. Remove the following three lines (or the entire sections they belong to):
   - `pico_bsp`
   - `rp2040_hal.Use_Startup`
   - `rp2040_hal.Interrupts`

2. Perform these search-and-replace operations (case-sensitive where shown):
   - Replace `"pico"` with `"pico2"`
   - Replace `"rp2040"` with `"rp2350"`
   - Replace `"rpi_pico"` with `"rpi_pico2"`
   - Replace `Pico_` with `Pico2_` (preserving case)
   - Replace `pico_` with `pico2_` (preserving case)
   - Replace `RPI-RP2` with `RP2350`
   - Replace `_rp2040` with `_rp2350`

3. Update the version of the HAL crate:
   - Change the version of `rp2040_hal` from `"^2.7"` to `"^3.0.0-alpha1"`

4. Add a new `[[pins]]` section at the bottom of the file with the following content:

```toml
[[pins]]
rp2040_hal = { url='https://github.com/JeremyGrosser/rp2040_hal', branch='3.x' }
```

5. Finally, add this line inside the `[configuration.values]` section:

```toml
rp2040_hal.device = "RP2350A"
```

Now, if you **do** use GVim (and why wouldn’t you?), I have a neat little function that does all of the above in one go.
Just drop this into your `~/.vimrc` or run it once in the `alire.toml` buffer:

```vim
function! Alire_Pico_To_Pico2()
    " Remove unwanted configuration entries
    %g/pico_bsp/                delete
    %g/rp2040_hal\.Use_Startup/ delete
    %g/rp2040_hal\.Interrupts/  delete

    " Perform all the renames
    %s/\C"pico"/"pico2"/ge
    %s/\C"rp2040"/"rp2350"/ge
    %s/\C"rpi_pico"/"rpi_pico2"/ge
    %s/\CPico_/Pico2_/ge
    %s/\Cpico_/pico2_/ge
    %s/\CRPI-RP2/RP2350/ge
    %s/\C_rp2040/_rp2350/ge

    " Update HAL version
    %s/rp2040_hal\s*=\s*"\^2\.7"/rp2040_hal = "^3.0.0-alpha1"/ge

    " Add configuration value for the new device
    /\[configuration\.values\]/ append
rp2040_hal.device               = "RP2350A"
.

    " Add the pins section for the bleeding-edge HAL
    /\[configuration\.values\]/ insert
[[pins]]
rp2040_hal = { url='https://github.com/JeremyGrosser/rp2040_hal', branch='3.x' }

.
endfunction
```

After defining the function, simply position the cursor anywhere in the `alire.toml` file and run `:call
Alire_Pico_To_Pico2()` — and the file is instantly updated for the Pico 2 W. It really is that quick!

The magic part is the new `[[pins]]` section, which pulls in the latest “alpha1” version of the HAL directly from
[Jeremy Grosser’s](https://github.com/JeremyGrosser) repository. As I said — this is still highly experimental, but it
works remarkably well so far.

## Build and deploy

Remember to run `make clean` (macOS / Linux) or `nmake clean` (Windows) before you build the first time.  If you don’t
have a make tool installed yet, simply delete the entire `alire` directory (I had to do this after copying the project
folders to activate the `[[pins]]`).

Apart from that, everything works exactly as before — at least for the chapters we have covered so far. It may become a
little more involved later in the series, but for now the transition is pleasantly smooth.

[![LED and Button](20260330_173452.jpeg?fit=640x640 "LED and Button")](20260330_173452.jpeg)

{{< instagram DWhQeXPE-C6 >}}

## Update

If you don't want to copy then `pico.ads` file you can also use my experimental fork of `pico_bsp`.

```toml
[[depends-on]]
pico_bsp                        = "^3.0.0-alpha1"
rp2040_hal                      = "^3.0.0-alpha1"
light_tasking_rp2350            = "^15.2"

[[pins]]
pico_bsp                        = { url='https://github.com/krischik/pico_bsp',         branch='develop' }
rp2040_hal                      = { url='https://github.com/JeremyGrosser/rp2040_hal',  branch='3.x'     }

[configuration.values]
pico_bsp.device                 = "RP2350A"
rp2040_hal.device               = "RP2350A"
light_tasking_rp2350.Max_CPUs   = 2
light_tasking_rp2350.Board      = "rpi_pico2"
```

This fork also has a few other extras. Just remember that this is all still very experimental.

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
