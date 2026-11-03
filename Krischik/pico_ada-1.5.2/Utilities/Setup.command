#!/bin/echo usage: source
########################################################### {{{1 ###########
#   Copyright © 2026 … 2026 "Martin Krischik" «krischik@users.sourceforge.net»
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

typeset -x -U -T C_INCLUDE_PATH	    c_include_path	":"
typeset -x -U -T CPATH		    cpath		":"
typeset -x -U -T CPLUS_INCLUDE_PATH cplus_include_path	":"
typeset -x -U -T FPATH		    fpath		":"
typeset -x -U -T LD_LIBRARY_PATH    ld_library_path	":"
typeset -x -U -T LDFLAGS	    ldflags		" "
typeset -x -U -T LIBRARY_PATH	    library_path	":"
typeset -x -U -T PATH		    path		":"
typeset -f -u	 realFile

fpath=(~/.functions ${fpath})

if test -d "/opt/homebrew"; then
    typeset -x brew="${brew-/opt/homebrew}"
elif test -d "/usr/local"; then
    typeset -x brew="${brew-/usr/local}"
else
    echo "Please install Brew"
    false
fi

if test -d "/opt/local"; then
    typeset -x port="${port-/opt/local}"
else
    echo "Please install MacPorts"
    false
fi

if test -e "${HOME}/Work"; then
    typeset -x WORK=$(realFile "${HOME}/Work")
elif test -e "/Work"; then
    typeset -x WORK=$(realFile "/Work")
elif test -e "/Users/Shared/Work"; then
    typeset -x WORK=$(realFile "/Users/Shared/Work")
elif test -e "/Volumes/home/Work"; then
    typeset -x WORK=$(realFile "/Volumes/home/Work")
fi

typeset			  Developer="/Applications/Developer"
typeset			 Web_Server="krischik@web.sourceforge.net:/home/project-web/pi-ada-tutorial"
typeset		    Python_Packages="$(python3 -c "import sysconfig; print(sysconfig.get_path('purelib'))")"
typeset -x		    SDKROOT="$(xcrun --show-sdk-path)"
typeset -x		   Homepage=$(realFile "${WORK}/Homepage/Pi-Ada-Tutorial")
typeset -x		  Workspace=$(realFile "${WORK}/Workspaces/Pi-Ada-Tutorial")
typeset -x		Pico_Upload="/Volumes/RPI-RP2"
typeset -x	       Pico2_Upload="/Volumes/RP2350"
typeset -x	    Pico_Debug_UART=$(ls -1 /dev/cu.usbmodem*)
typeset -x	       PROJECT_HOME=${PROJECT_HOME-$(realFile "${WORK}/Projects/Pi-Ada-Tutorial/develop")}
typeset -x	       PROJECT_NAME=${PROJECT_NAME-"Pi-Ada-Tutorial"}
typeset -x	     GNAT_CODE_PAGE=utf8
typeset -x	  GNAT_CCS_ENCODING=U8TEXT
typeset -x	  Homepage_Worktree=$(realFile "${PROJECT_HOME}/../develop")
typeset -x		   GPS_HOME=$(realFile "${Developer}/GNATStudio.app")

typeset		  SourceForce_Local="${PROJECT_HOME}/Downloads"
typeset		 SourceForce_Remote="krischik@frs.sourceforge.net:/home/frs/project/pi-ada-tutorial"
typeset -x		   Homepage=$(realFile "${Homepage-${WORK}/HomePage/Pi-Ada-Tutorial}")
typeset -x		VSCODE_ROOT=$(realFile "${Developer}/Visual Studio Code.app")
typeset -x	       OPENOCD_ROOT=${OPENOCD_ROOT-"/opt/openocd"}
typeset -x	      HOMEPAGE_ROOT="${Homepage}/htdocs"
typeset -x   		    GPS_ROOT="${GPS_HOME}/Contents/Resources"

typeset -x		 PYTHONPATH="${GPS_ROOT}/share/gnatstudio/python"
typeset -x	      XDG_DATA_DIRS="${GPS_ROOT}/share"
typeset -x	     GTK_EXE_PREFIX="${GPS_ROOT}"
typeset -x	    GI_TYPELIB_PATH="${GPS_ROOT}/lib/girepository-1.0"
typeset -x    GNATSTUDIO_PYTHONHOME="${GPS_ROOT}"
typeset -x   GDK_PIXBUF_MODULE_FILE="${GPS_ROOT}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
typeset -x	      HOMEPAGE_SITE="${HOMEPAGE_ROOT}/javadoc"
typeset -x	    HOMEPAGE_DEPLOY="${HOMEPAGE_ROOT}/Repository"

path=("${PROJECT_HOME}/Utilities" ${path})
path=("${GPS_HOME}/Contents/MacOS" ${path})
path=("/usr/local/opt/llvm/bin" ${path})
fpath=("${HOME}/.functions" ${fpath})
fpath=("${PROJECT_HOME}/Utilities" ${fpath})

ld_library_path=(${brew}/lib ${ld_library_path})
ld_library_path=(${SDKROOT}/usr/lib ${ld_library_path})
ldflags=(-L${brew}/lib ${ldflags})
ldflags=(-L${SDKROOT}/usr/lib ${ldflags})
library_path=(${brew}/lib ${library_path})
library_path=(${SDKROOT}/usr/lib ${library_path})

function lxpm ()
{
    if test -n "${MODULE_NAME}"; then
	Server_Name="${MODULE_NAME//\//_}"
    else
	Server_Name="${PROJECT_NAME}"
    fi

    if test -z "${1}"; then
	${VIM}/../../MacOS/Vim -g --servername "${Server_Name}" 1>/dev/null 2>/dev/null &
    else
	${VIM}/../../MacOS/Vim -g --servername "${Server_Name}" --remote-silent "${@}" 1>/dev/null 2>/dev/null &
    fi

    return
} # function

typeset -f -u ssh_add_key
typeset -f -u debug-get-uart-port
typeset -f -u debug-get-uart-device

############################################################ {{{1 ###########
# vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 fileformat=unix filetype=zsh fileencoding=utf8 foldmethod=marker nospell :
