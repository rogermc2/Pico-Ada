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

Project_Name	:= pico_xbsp
Project_Libs	:= libPico_XBSP.a

all: development
	$(MAKE) -C "test_l"	$(@)
	$(MAKE) -C "test_lt"	$(@)
	$(MAKE) -C "test_e"	$(@)

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
	alr exec -P1 -- gnatpp --keep-going	\
	   src/none/pico-debug_io.adb		\
	   src/swd/pico-debug_io.adb		\
	   src/tasking/pico-uart_io.adb		\
	   src/tasking/pico-usb_io.adb		\
	   src/uart/pico-debug_io.adb		\
	   src/usb/pico-debug_io.adb
	../Utilities/fix-then
	$(MAKE) -C "test_l"	$(@)
	$(MAKE) -C "test_lt"	$(@)
	$(MAKE) -C "test_e"	$(@)

doc: release
	alr exec -P1 -- gnatdoc -l -b -p

clean:
	-rm -rf *.log alire bin lib config obj
	alr update
	$(MAKE) -C "test_l"	$(@)
	$(MAKE) -C "test_lt"	$(@)
	$(MAKE) -C "test_e"	$(@)

vscode:
	"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace

studio:
	${GPS_HOME}/Contents/MacOS/gnatstudio ${Project_Name}.gpr

update:
	alr update

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
	@echo "  make development			    → build all with debug active"
	@echo "  make validation			    → build all with contracts active"
	@echo "  make release				    → build all with optimizer active"
	@echo "  make doc				    → generate gnatdoc documenation"
	@echo "  make pretty				    → pretty print source code"
	@echo "  make clean				    → clean build system"
	@echo "  make vscode				      → start Visual Studio Code"
	@echo "  make studio				      → start GNAT Programming Studio"
	@echo ""
	@echo "Deploy targets (development version, Pico is in BOOTSEL mode):"
	@for app in $(Project_Apps); do \
		printf "  make deploy_%-30s → deploy %s\n" "$$app" "$$app"; \
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
