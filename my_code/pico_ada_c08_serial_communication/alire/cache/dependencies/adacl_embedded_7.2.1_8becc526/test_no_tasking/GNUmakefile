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

.PHONY: all run test pretty doc clean update

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

Project_Name	:= adacl_embedded_test_no_tasking
Tool_Name	:= adacl_embedded_test-main

export ADACL_TRACE:=ON
export ADACL_TRACETO:=FILE
export ADACL_TRACEFILE:=share/adacl_embedded_test_no_tasking/adacl_embedded_test_no_tasking.log

all run test: validation
	alr run --skip-build

release:
	alr build --release

development:
	alr build --development

validation:
	alr build --validation

pretty: 
	-alr build --validation
	alr exec -P1 -- gnatpp
	../../Utilities/fix-then

doc: release
	alr exec -P1 -- gnatdoc -l -b -p

clean:
	-alr clean
	-rm -r obj bin alire config *.log share/adacl_embedded_test_no_tasking/*.log
	alr update

update:
	-alr clean --cache
	alr toolchain --select
	alr update
	$(MAKE) all

vscode:
	"${VSCODE_ROOT}/Contents/MacOS/Code" ${Project_Name}.code-workspace

studio:
	${GPS_HOME}/Contents/MacOS/gnatstudio ${Project_Name}.gpr

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=make foldmethod=marker :
# vim: set spell spelllang=en_gb :
