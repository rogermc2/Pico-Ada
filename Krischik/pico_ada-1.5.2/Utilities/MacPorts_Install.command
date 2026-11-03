#!/opt/local/bin/zsh
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

setopt No_XTrace
setopt No_Err_Exit

if test "${USER}" = "root"; then
    port selfupdate
    port sync
    port upgrade outdated

    port install		    \
	"clang-22"		    \
	"clang_select"		    \
	"clang_select-22"	    \
	"cmake"			    \
	"cmake-docs"		    \
	"llvm-22"		    \
	"llvm_select-22"

    port select --set clang mp-clang-22

    port install		    \
	"arm-none-eabi-gdb"	    \
	+python313		    \
	configure.compiler=macports-clang-22

    port install		    \
	"arm-none-eabi-binutils"    \
	"arm-none-eabi-gcc"	    \

    echo "===> Rev Upgrade"
    port rev-upgrade

    echo "===> Uninstall Inactive"
    port -p uninstall inactive

    echo "===> Uninstall Outdated"
    port -p uninstall outdated

    echo "===> Clean"
    port -f clean --all all
else
    setopt Multi_OS

    sudo ${0:a} >&1 2>&2 &>~/Library/Logs/${0:r:t}.out
fi

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
