#!/opt/local/bin/zsh
########################################################### {{{1 ###########
#   Copyright (C) 2005 … 2021  Martin Krischik
#
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
############################################################################
#   $Author: krischik $
#   $Revision: 8195 $
#   $Date: 2022-07-21 15:19:51 +0200 (Do, 21. Jul 2022) $
#   $Id: Deploy.command 8195 2022-07-21 13:19:51Z krischik $
########################################################### }}}1 ###########

source ${0:h}/Setup.command

setopt No_XTrace
setopt No_Verbose
setopt SH_Word_Split
setopt Err_Exit
setopt CSH_Null_Glob

typeset in_Version="${1}"

gmkdir --parents "${SourceForce_Local}/Sources/"

if test -z "${in_Version}"; then
    echo "Version number missing"
else
    pushd ${PROJECT_HOME}
	git archive --format zip --output "${SourceForce_Local}/Sources/pico_ada-${in_Version}.zip" "v_${in_Version}"
    popd
fi

########################################################### {{{1 ###########
# vim: textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: filetype=zsh fileencoding=utf8 fileformat=unix :
