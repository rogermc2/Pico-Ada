---
title       : "From Repetitive to Elegant: My Improved Pico Ada Makefile"
description : "How I rewrote my Pico Ada Makefile to auto-detect the RPI-RP2 volume, eliminate repetition with templates, and add proper help — works nicely on Linux and macOS."
summary	    : "I started with a repetitive Makefile that broke without manual Pico_Upload. After some pair programming with Grok, here’s the much cleaner version I now use for every chapter."
authors     : "Martin Krischik «krischik@users.sourceforge.net»"
lastmod     : 2026-03-11T12:00:20+0100
date        : 2026-03-11T07:51:15+0100
draft       : false
type	    : "page"
layout	    : "single"
categories  : ["flashing", "side-quest", "macos", "linux", "windows"]
tags        : ["picotool", "makefile", "uf2", "deploy"]
---

To make development smoother I normally create a classic Makefile to handle and document the tasks that Alire cannot
manage itself. Alire already takes care of dependency management, which makes writing Makefiles much simpler. I started
with something like this, which can build, convert to UF2, and deploy to the Pico:

```make
Project_Name    := pico_ada_c01_led
App_0           := blink

deploy_0: bin/${App_0}.uf2
        gcp --verbose "bin/${App_0}.uf2" "${Pico_Upload}"
        sync

bin/${App_0}.uf2: bin/${App_0}

bin/${App_0}: src/${App_0}.adb ${Project_Name}.gpr alire.toml src/*.ad?

development:
        alr build --development

release:
        alr build --release

validation:
        alr build --validation

pretty: development
        alr exec -P1 -- gnatpp

doc: release
        alr exec -P1 -- gnatdoc -l -b -p

clean:
        -rm *.log
        -rm -r -f alire
        -rm -r bin
        -rm -r config
        -rm -r obj

bin/%.uf2: bin/%
        picotool uf2 convert $(<) -t elf $(@)

bin/%: src/%.adb ${Project_Name}.gpr alire.toml
        alr build --development $(<)
```

Because I am planning one crate per chapter of the [Freenove Ultimate Starter Kit for Raspberry Pi Pico C
Tutorial](https://docs.freenove.com/projects/fnk0058/en/latest/fnk0058/codes/C.html) — and some chapters contain several
example programs — there would soon be `deploy_1`, `deploy_2`, and so on. That quickly leads to repetition. Deployment
would also fail silently if `${Pico_Upload}` was not set.

Having learnt Makefiles with `nmake` many years ago, I suspected I might have missed some useful modern GNU Make
features. So I asked Grok whether there was a cleaner way to write it. And yes — there was quite a lot that could be
improved.

This is the much-improved version we arrived at together[¹](#1):

```make
.PHONY: development release validation pretty doc clean help

# ────────────────────────────────────────────────
# Configuration
# ────────────────────────────────────────────────

Project_Name	:= pico_ada_c01_led
Project_Apps	:= blink

# ────────────────────────────────────────────────
# Pico mount point auto-detection / guard
# ────────────────────────────────────────────────

ifeq ($(Pico_Upload),)
    # Try common Linux locations first
    Pico_Upload := $(firstword $(wildcard \
        /media/$(USER)/RPI-RP2 \
        /run/media/$(USER)/RPI-RP2 \
        /media/$(USER)/RPI_RP2 \
        /media/usb/RPI-RP2))

    # Then try macOS (most reliable name)
    ifeq ($(Pico_Upload),)
        Pico_Upload := $(wildcard /Volumes/RPI-RP2)
    endif

    # Final fallback: still empty? → error
    ifeq ($(Pico_Upload),)
        $(error Pico bootloader mount point not found automatically. \
Please plug in the Pico while holding the BOOTSEL button, then set: \
    export Pico_Upload=/path/to/RPI-RP2 \
Common locations: \
  Linux .......... /media/$(USER)/RPI-RP2   or   /run/media/$(USER)/RPI-RP2 \
  macOS .......... /Volumes/RPI-RP2 \
See 'make help' for full instructions.)
    endif

    # Inform user what we auto-detected (helps debugging)
    $(info Detected Pico_Upload = $(Pico_Upload))
endif

# ────────────────────────────────────────────────
# Template for each application
# ────────────────────────────────────────────────

define App_Template
deploy_${1}: bin/${1}.uf2 check-pico-upload
	cp -v "bin/${1}.uf2" "$(Pico_Upload)/"
	sync
	@echo ""
	@echo "Deployed ${1} to Pico."
	@echo "(macOS users: ignore any 'not ejected properly' warning.)"

bin/${1}.uf2: bin/${1}

bin/${1}: src/${1}.adb ${Project_Name}.gpr alire.toml src/*.ad?
endef

# Instantiate the template for every app
$(foreach app,$(Project_Apps),$(eval $(call App_Template,$(app))))

# ────────────────────────────────────────────────
# Generic / shared rules
# ────────────────────────────────────────────────

development:
	alr build --development

release:
	alr build --release

validation:
	alr build --validation

pretty: development
	alr exec -P1 -- gnatpp

doc: release
	alr exec -P1 -- gnatdoc -l -b -p

clean:
	-rm -rf *.log alire bin config obj

bin/%.uf2: bin/%
	picotool uf2 convert $(<) -t elf $(@)

bin/%: src/%.adb ${Project_Name}.gpr alire.toml
	alr build --development $(<)

check-pico-upload:
	@if [ ! -d "$(Pico_Upload)" ]; then \
		echo "Error: '$(Pico_Upload)' does not exist or is not mounted."; \
		echo "  1. Hold BOOTSEL button on the Pico"; \
		echo "  2. Plug it into USB while holding the button"; \
		echo "  3. Release button once it appears (RPI-RP2)"; \
		echo "Then retry 'make deploy_0'"; \
		exit 1; \
	fi

help:
	@echo "pico_ada_c01_led – quick help"
	@echo ""
	@echo "Build targets:"
	@echo "  make development         → build all with debug active"
	@echo "  make validation          → build all with contracts active"
	@echo "  make release             → build all with optimizer active"
	@echo "  make doc                 → generate gnatdoc documentation"
	@echo "  make pretty              → pretty-print source code"
	@echo "  make clean               → clean build artefacts"
	@echo ""
	@echo "Deploy targets (development version, Pico is in BOOTSEL mode):"
	@for app in $(Project_Apps); do \
		printf "  make deploy_%-12s → deploy %s\n" "$$app" "$$app"; \
	done
	@echo ""
	@echo "Current Pico_Upload = $(or $(Pico_Upload),not set – see instructions below)"
	@echo ""
	@echo "To deploy:"
	@echo "  1. Hold BOOTSEL while plugging in Pico"
	@echo "  2. It appears as RPI-RP2"
	@echo "  3. macOS: /Volumes/RPI-RP2"
	@echo "     Linux: usually /media/$$USER/RPI-RP2"
	@echo "  4. export Pico_Upload=/path/to/RPI-RP2"
```

## So what actually got better?

**Help target and comments**  
The Makefile now includes a clear `help` target and plenty of section comments. Anyone who opens the file immediately
understands what is possible and how to use it — very useful for readers following along with the tutorial.

**Smarter Pico mount-point detection**  
Instead of simply complaining that `${Pico_Upload}` is unset, the Makefile now tries to find the RPI-RP2 volume
automatically on both Linux and macOS using common mount locations. If it still cannot find anything, it prints a
detailed, step-by-step error message with examples. Much friendlier.

**DRY with a template**  
I had never used `define` / `eval` / `foreach` in Make before — it is genuinely elegant. Now I only need to list the program names once in `Project_Apps := blink led_switch …` and all the corresponding `deploy_…`, `.uf2` and build rules are generated automatically. The `help` target updates itself too. Very little repetition.

-----

#### 1
I’m not “vibe coding”. I think vibe coding is daft and I check every line Grok suggests. This is proper pair programming.

<!-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab : -->
<!-- vim: set textwidth=120 filetype=markdown foldmethod=marker : -->
<!-- vim: set spell spelllang=en_gb : -->
