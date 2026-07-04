############################################################# {{{1 ##########
#  Copyright © 2026 … 2026 Martin Krischik «krischik@users.sourceforge.net»
#############################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see «http://www.gnu.org/licenses/».
############################################################# }}}1 ##########

.PHONY: all development release validation pretty doc clean help

# ────────────────────────────────────────────────
# Configuration
# ────────────────────────────────────────────────

Project_Name	:= pico_ada_c08_serial_communication
Project_Apps	:= sketch_08_1_serial_print
Project_Apps	+= sketch_08_2_serial_rw

all: $(addprefix bin/release/,$(addsuffix .uf2,$(Project_Apps)))

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
       $(warning Pico bootloader mount point not found automatically. \
Please plug in the Pico while holding the BOOTSEL button, then set: \
    export Pico_Upload=/path/to/RPI-RP2 \
Common locations: \
  Linux .......... /media/$(USER)/RPI-RP2   or	 /run/media/$(USER)/RPI-RP2 \
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
deploy_${1}: bin/release/${1}.uf2
	cp -v "bin/release/${1}.uf2" "$(Pico_Upload)/"
	sync
	@echo ""
	@echo "Deployed ${1} to Pico."
	@echo "(macOS users: ignore any 'not ejected properly' warning.)"

start_${1}: bin/development/${1}
	${port}/bin/arm-none-eabi-gdb -batch -nx --command="start.gdb" bin/development/${1}
	start.expect

bin/development/${1}.uf2: bin/development/${1}
bin/validation/${1}.uf2:  bin/validation/${1}
bin/release/${1}.uf2:	  bin/release/${1}

bin/development/${1}:src/${1}.adb ${Project_Name}.gpr alire.toml GNUmakefile src/*.ad?
bin/validation/${1}: src/${1}.adb ${Project_Name}.gpr alire.toml GNUmakefile src/*.ad?
bin/release/${1}:    src/${1}.adb ${Project_Name}.gpr alire.toml GNUmakefile src/*.ad?
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

pretty:
	-alr build --development
	alr exec -P1 -- gnatpp --keep-going
	../Utilities/fix-then

doc: release
	alr exec -P1 -- gnatdoc -l -b -p

clean:
	-rm -rf *.log alire bin lib config obj
	alr update

vscode:
	"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace

studio:
	${GPS_HOME}/Contents/MacOS/gnatstudio ${Project_Name}.gpr

update:
	alr update

bin/%.uf2: bin/%
	picotool uf2 convert $(<) -t elf $(@)

bin/development/%: src/%.adb
	alr build --development $(<)

bin/validation/%: src/%.adb
	alr build --validation $(<)

bin/release/%: src/%.adb
	alr build --release $(<)

check-pico-upload:
	@if [ ! -d "$(Pico_Upload)" ]; then \
		echo "Error: '$(Pico_Upload)' does not exist or is not mounted."; \
		echo "	1. Hold BOOTSEL button on the Pico"; \
		echo "	2. Plug it into USB while holding the button"; \
		echo "	3. Release button once it appears (RPI-RP2)"; \
		echo "Then retry 'make deploy_0'"; \
		exit 1; \
	fi

help:
	@echo "${Project_Name} – quick help"
	@echo ""
	@echo "Build targets:"
	@echo "  make development			      → build all with debug active"
	@echo "  make validation			      → build all with contracts active"
	@echo "  make release				      → build all with optimizer active"
	@echo "  make doc				      → generate gnatdoc documenation"
	@echo "  make pretty				      → pretty print source code"
	@echo "  make clean				      → clean build system"
	@echo "  make vscode				      → start Visual Studio Code"
	@echo "  make studio				      → start GNAT Programming Studio"
	@echo ""
	@echo "Start targets (development version, openocd is running):"
	@for app in $(Project_Apps); do \
		printf "  make start_%-33s → start %s\n" "$$app" "$$app"; \
	done
	@echo ""
	@echo "Deploy targets (release version, Pico is in BOOTSEL mode):"
	@for app in $(Project_Apps); do \
		printf "  make deploy_%-32s → deploy %s\n" "$$app" "$$app"; \
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

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=8 noexpandtab :
# vim: set textwidth=0 filetype=make foldmethod=marker :
# vim: set spell spelllang=en_gb :
