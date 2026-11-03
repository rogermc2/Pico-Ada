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
    "${VSCODE_ROOT}/Contents/MacOS/Code" "."  &
popd

############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=78 fileformat=unix filetype=zsh foldmethod=marker nospell :
