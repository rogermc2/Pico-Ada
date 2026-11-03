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

setopt No_XTrace
setopt No_Err_Exit
setopt MultiOS

typeset OPENOCD_ROOT=${OPENOCD_ROOT-"/opt/openocd"}

if test "${USER}" = "root"; then
    sudo mkdir ${OPENOCD_ROOT}
    sudo chown ${USER} ${OPENOCD_ROOT}
else
    if ! test -w ${OPENOCD_ROOT}; then
	sudo ${0:a} >&1 2>&2 &>~/Library/Logs/${0:r:t}.out
    fi

    pushd ${PROJECT_HOME}/Library/openocd 
	./bootstrap
	./configure			\
	    --disable-werror		\
	    --enable-picoprobe		\
	    --prefix= ${OPENOCD_ROOT}
	make -j4
	make install
    popd
fi

# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
