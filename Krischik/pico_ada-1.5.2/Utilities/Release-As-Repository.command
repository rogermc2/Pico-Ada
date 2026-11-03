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

setopt No_XTrace
setopt No_Verbose
setopt SH_Word_Split
setopt Err_Exit
setopt CSH_Null_Glob
setopt Extended_Glob


for I in "pico_xbsp" "pico_ada_"* "pico2_ada_"*; do
    pushd "${PROJECT_HOME}/${I}"
        Local_Index="${PROJECT_HOME}/Library/alire-index/index/${I:0:2}/${I}"
        Comunity_Index="${HOME}/.config/alire/indexes/community/repo/index/${I:0:2}/${I}"
        Krischik_Index="${HOME}/.config/alire/indexes/krischik/repo/index/${I:0:2}/${I}"

        alr publish

        if ! test -d "${Local_Index}"; then
            mkdir -p "${Local_Index}"
        fi
        if ! test -d "${Comunity_Index}"; then
            mkdir -p "${Comunity_Index}"
        fi
        if ! test -d "${Krischik_Index}"; then
            mkdir -p "${Krischik_Index}"
        fi

        pushd "alire/releases"
            gcp --verbose --update --target-directory="${Local_Index}" ${I}-*.toml
            # gcp --verbose --update --target-directory="${Comunity_Index}" ${I}-*.toml~${I}-*-dev.toml
            # gcp --verbose --update --target-directory="${Krischik_Index}" ${I}-*.toml~${I}-*-dev.toml
        popd

        alr index --update-all
    popd
done; unset I

########################################################### {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set filetype=zsh fileencoding=utf-8 fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en_gb :
