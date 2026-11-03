#!/opt/local/bin/zsh
########################################################### {{{1 ###########
#   Copyright © 2023 … 2024  "Martin Krischik" «krischik@users.sourceforge.net»
############################################################################
#   This program is free software; you can redistribute it and/or
#   modify it under the terms of the GNU General Public License
#   as published by the Free Software Foundation; either version 2
#   of the License, or (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
########################################################### }}}1 ###########

source ${0:h}/Setup.command

setopt Err_Exit
setopt No_XTrace

if test -n "${MODULE_NAME}"; then
    Server_Name="${MODULE_NAME//\//_}"
else
    Server_Name="${PROJECT_NAME}"
fi

pushd "${PROJECT_HOME}/${MODULE_NAME}"
    gvim --servername "${Server_Name}"			\
	1>~/Library/Logs/${Server_Name}-${0:t:r}.out	\
	2>~/Library/Logs/${Server_Name}-${0:t:r}.err	&

    sleep 5

    if test -e "${PROJECT_HOME}/Utilities/Functions.vim"; then
	gvim --servername "${Server_Name}" --remote-send ":source ${PROJECT_HOME}/Utilities/Functions.vim<CR>"
    fi

    gvim --servername "${Server_Name}" --remote-send ":TlistToggle<CR>"

    if test -e alire.toml; then
	gvim --servername "${Server_Name}" --remote-send ":TlistAddFiles ${PROJECT_HOME}/${MODULE_NAME}/src/*.ad?<CR>"

	if test -e "src/${MODULE_NAME}.ads"; then
	    gvim --servername "${Server_Name}" --remote-send ":edit src/${MODULE_NAME}.ads<CR>"
	elif test -e "src/${MODULE_NAME}.adb"; then
	    gvim --servername "${Server_Name}" --remote-send ":edit src/${MODULE_NAME}.adb<CR>"
	else
	    gvim --servername "${Server_Name}" --remote-send ":compiler alire<CR>"
	fi
    fi
popd

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=78 fileformat=unix filetype=zsh foldmethod=marker nospell :
