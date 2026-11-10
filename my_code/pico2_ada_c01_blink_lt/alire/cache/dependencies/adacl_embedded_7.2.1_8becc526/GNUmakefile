############################################################# {{{1 ##########
#  Copyright © 2012 … 2020 Martin Krischik «krischik@users.sourceforge.net»
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

.PHONY: all release validation development run test pretty doc clean update

# Detect OS in a portable way
ifeq ($(OS),Windows_NT)
    ALR := alr.exe
    EXE_SUFFIX := .exe
else
    UNAME_S := $(shell uname -s)
    ifeq ($(UNAME_S),Darwin)
	ALR := alr
    else ifeq ($(UNAME_S),Linux)
	ALR := alr.AppImage
    else
	$(error Unsupported OS: $(UNAME_S))
    endif
    EXE_SUFFIX :=
endif

Project_Name	:= adacl-embedded
Tool_Name	:= libAdaCL-Embedded.a

all: release

release:
	${ALR} build --release

validation:
	${ALR} build --validation

development:
	${ALR} build --development

run: validation
	$(MAKE) -C "test"		$(@)

test: validation
	$(MAKE) -C "prove_log_off"	$(@)
	$(MAKE) -C "prove_no_tasking"	$(@)
	$(MAKE) -C "prove_tasking"	$(@)
	$(MAKE) -C "test_log_off"	$(@)
	$(MAKE) -C "test_no_tasking"	$(@)
	$(MAKE) -C "test_tasking"	$(@)

test-release: release
	${ALR} test

pretty:
	-${ALR} build --development
	-${ALR} exec -P1 -- gnatpp  --keep-going    \
	    src/adacl-text_io.adb		    \
	    src/adacl.ads			    \
	    src/log_off/*.ad?			    \
	    src/no_tasking/*.ad?		    \
	    src/tasking/*.ad?
	../Utilities/fix-then
	$(MAKE) -C "prove_log_off"	$(@)
	$(MAKE) -C "prove_no_tasking"	$(@)
	$(MAKE) -C "prove_tasking"	$(@)
	$(MAKE) -C "test_log_off"	$(@)
	$(MAKE) -C "test_no_tasking"	$(@)
	$(MAKE) -C "test_tasking"	$(@)

doc: release
	${ALR} build --release
	${ALR} exec -P1 -- gnatdoc -l -b -p
	$(MAKE) -C "prove_log_off"	$(@)
	$(MAKE) -C "prove_no_tasking"	$(@)
	$(MAKE) -C "prove_tasking"	$(@)
	$(MAKE) -C "test_log_off"	$(@)
	$(MAKE) -C "test_no_tasking"	$(@)
	$(MAKE) -C "test_tasking"	$(@)

clean:
	-alr clean
	-rm -r obj lib alire config
	alr update
	$(MAKE) -C "prove_log_off"	$(@)
	$(MAKE) -C "prove_no_tasking"	$(@)
	$(MAKE) -C "prove_tasking"	$(@)
	$(MAKE) -C "test_log_off"	$(@)
	$(MAKE) -C "test_no_tasking"	$(@)
	$(MAKE) -C "test_tasking"	$(@)

update:
	${ALR} clean --cache
	${ALR} toolchain --select
	${ALR} update
	$(MAKE) all
	$(MAKE) -C "prove_log_off"	$(@)
	$(MAKE) -C "prove_no_tasking"	$(@)
	$(MAKE) -C "prove_tasking"	$(@)
	$(MAKE) -C "test_log_off"	$(@)
	$(MAKE) -C "test_no_tasking"	$(@)
	$(MAKE) -C "test_tasking"	$(@)

vscode:
	"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace

studio:
	${GPS_HOME}/Contents/MacOS/gnatstudio ${Project_Name}.gpr

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=120 filetype=make foldmethod=marker :
# vim: set spell spelllang=en_gb :
