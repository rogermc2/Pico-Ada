#!/bin/zsh
########################################################### {{{1 ###########
#   Copyright © 2005 … 2023 Martin Krischik
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

setopt No_XTrace
setopt No_Verbose
setopt SH_Word_Split
setopt Err_Exit
setopt CSH_Null_Glob
setopt Extended_Glob

pushd "${PROJECT_HOME}"
    alr index --update-all
    git status

    for I in "pico_xbsp" "pico_ada_c"* "pico2_ada_c"*; do
        vared -p "Release ${I} (y/n)?" -c Do_Release

        if test ${(U)Do_Release} = "Y"; then
            pushd "${PROJECT_HOME}/${I}"
                alr  --force publish --tar
                alr index --update-all
            popd
        fi

        unset Do_Release
    done; unset I
popd

########################################################### {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set filetype=zsh fileencoding=utf-8 fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en_gb :
