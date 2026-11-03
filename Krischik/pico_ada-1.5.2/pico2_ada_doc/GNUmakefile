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

.PHONY: development release validation pretty doc clean help

# ────────────────────────────────────────────────
# Configuration
# ────────────────────────────────────────────────

Project_Name	:= pico2_ada_doc
Project_Apps	:= 

all: doc

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
	alr exec -P1 -- gnatpp --keep-going 
	../Utilities/fix-then

doc: release
	alr exec -P1 -- gnatdoc -l -b -p

clean:
	-rm -rf *.log alire bin config obj

vscode:
	"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace

studio:
	${GPS_HOME}/Contents/MacOS/gnatstudio ${Project_Name}.gpr

update:
	alr update

bin/%: src/%.adb
	alr build --development $(<)

help:
	@echo "${pico2_ada_doc} – quick help"
	@echo ""
	@echo "Build targets:"
	@echo "  make development                 → build all with debug active"
	@echo "  make validation                  → build all with contracts active"
	@echo "  make release                     → build all with optimizer active"
	@echo "  make doc                         → generate gnatdoc documenation"
	@echo "  make pretty                      → pretty print source code"
	@echo "  make clean                       → clean build system"
	@echo "  make vscode                      → start Visual Studio Code"
	@echo "  make studio                      → start GNAT Programming Studio"
	@echo ""

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=8 noexpandtab :
# vim: set textwidth=0 filetype=make foldmethod=marker :
# vim: set spell spelllang=en_gb :
