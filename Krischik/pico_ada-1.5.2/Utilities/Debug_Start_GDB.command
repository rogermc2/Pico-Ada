#!/usr/bin/env zsh
############################################################ {{{1 ###########
#  Copyright © 2026 … 2026  Martin Krischik «krischik@users.sourceforge.net»
#############################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or ENDIFFTNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see <http://www.gnu.org/licenses/>.
############################################################ }}}1 ###########

source ${0:h}/Setup.command

setopt ERR_EXIT NO_UNSET PIPE_FAIL

print "=== Safe GDB Connection ==="

stty sane

${port}/bin/arm-none-eabi-gdb		\
    --quiet				\
    -ex "set confirm off"		\
    -ex "set pagination off"		\
    -ex "set target-charset ASCII"	\
    -ex "set remotetimeout 30"		\
    -ex "target remote localhost:3333"	\
    -ex "monitor reset init"		\
    -ex "monitor halt"			\
    -ex "file ${1}"			\
    -ex "load"				\
    -ex "thread 1"			\
    -ex "break main"			\
    -ex "echo \n=== Connected! Both cores should be halted ===\n" \
    -ex "info threads"			\
    "${1}"

stty sane

############################################################ {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
