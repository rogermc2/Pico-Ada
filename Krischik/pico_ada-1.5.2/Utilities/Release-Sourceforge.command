#!/bin/zsh
########################################################### {{{1 ###########
#   Copyright (C) 2005,2006  Martin Krischik
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
########################################################### }}}1 ###########

source ${0:h}/Setup.command

setopt No_XTrace;
setopt No_Verbose;
setopt SH_Word_Split;
setopt Err_Exit;
setopt CSH_Null_Glob;

pushd "${PROJECT_HOME}"
    if ! test -d "${SourceForce_Local}"; then
        test -n "${SourceForce_Remote}"
        test -n "${SourceForce_Local}"
        rsync                           \
            --rsh="ssh"                 \
            --archive                   \
            --update                    \
            --verbose                   \
            --keep-dirlinks             \
            --exclude='*/.backups'      \
            --exclude='.backups'        \
            --exclude='.gitkeep'	\
            --exclude='*.swp'		\
            --exclude='.svn'            \
            --exclude='CVS'             \
            --exclude='.localized'      \
            "${SourceForce_Remote}/."   \
            "${SourceForce_Local}/."
    fi

    if ! test -d "${SourceForce_Local}/Alire"; then
        mkdir -p "${SourceForce_Local}/Alire"
    fi

    gcp --verbose --update                                          \
        --target-directory="${SourceForce_Local}/Alire"             \
        pico_xbsp/alire/archives/pico_xbsp-*.tgz                    \
        pico_ada_*/alire/archives/pico_ada_*-*.tgz                  \
        pico2_ada_*/alire/archives/pico2_ada_*-*.tgz           

    test -n "${SourceForce_Remote}/Alire"
    test -n "${SourceForce_Local}/Alire"
    rsync                               \
        --rsh="ssh"                     \
        --archive                       \
        --update                        \
        --verbose                       \
        --keep-dirlinks                 \
        --exclude='*/.backups'          \
        --exclude='.backups'            \
        --exclude='.gitkeep'	        \
        --exclude='.DS_Store'           \
        --exclude='.gitignore'          \
        --exclude='*.swp'		\
        --exclude='.localized'          \
        --exclude='.svn'                \
        --exclude='CVS'                 \
        "${SourceForce_Local}/Alire/."        \
        "${SourceForce_Remote}/Alire/."

    open "https://sourceforge.net/projects/pi-ada-tutorial/files/Alire"

    echo 'Press key when toml file was created…'; read -k1 -s

    gcp --verbose --update                                          \
        --target-directory="${SourceForce_Local}/Alire"             \
        pico_xbsp/alire/releases/pico_xbsp-*.toml                   \
        pico_ada_*/alire/releases/pico_ada_*-*.toml                 \
        pico2_ada_*/alire/releases/pico2_ada_*-*.toml       

    test -n "${SourceForce_Remote}/Alire"
    test -n "${SourceForce_Local}/Alire"
    rsync                               \
        --rsh="ssh"                     \
        --archive                       \
        --update                        \
        --verbose                       \
        --keep-dirlinks                 \
        --exclude='*/.backups'          \
        --exclude='.backups'            \
        --exclude='.gitkeep'	        \
        --exclude='.DS_Store'           \
        --exclude='.gitignore'          \
        --exclude='*.swp'		\
        --exclude='.localized'          \
        --exclude='.svn'                \
        --exclude='CVS'                 \
        "${SourceForce_Local}/Alire/."  \
        "${SourceForce_Remote}/Alire/."
popd

########################################################### {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set filetype=zsh fileencoding=utf-8 fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en_gb :
