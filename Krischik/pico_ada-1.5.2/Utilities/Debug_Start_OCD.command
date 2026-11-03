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

# Purpose: Start OpenOCD for the Raspberry Pi Debug Probe with clear settings

setopt ERR_EXIT NO_UNSET PIPE_FAIL

typeset OPENOCD_ROOT=${OPENOCD_ROOT-"/opt/openocd"}
typeset Config
typeset SWD_Speed
typeset Target

function usage() {
    print -u2 "Usage: ${0:t} [1|2|pico1|pico2]"
    print -u2 "       Default: pico1 ${DEFAULT_VERSION}"
    exit 1
}

function ask_pico_type() {
    local Choice

    print "Which device do you want to Debug?"
    print "  1) Raspberry Pi Pico 1 (RP2040)"
    print "  2) Raspberry Pi Pico 2 (RP2350)"
    print -n "Enter 1 or 2 [1]: "
    read -r Choice

    case ${Choice:-1} in
        1) return 1 ;;   # Pico 1
        2) return 2 ;;   # Pico 2
        *) print -u2 "Invalid choice."; exit 1 ;;
    esac
}

function get_config_name() {
    case ${1} in
        1) print "rp2040.cfg" ;;
        2) print "rp2350.cfg" ;;
        *) print -u2 "Unknown target type ${1}"; exit 1 ;;
    esac
}

# Ask for device type if not supplied on command line
if (( $# >= 1 )); then
    case ${1:l} in
        pico1|pico|1)       Target=1 ;;
        pico2|rp2350|2)     Target=2 ;;
        *)                  usage    ;;
    esac
    shift
else
    ask_pico_type
    Target=${?}
fi

# Configuration — change these if you need to experiment
# SWD_Speed=1000	# super slow for openocd debugging.
# SWD_Speed=2000	# slower but more robust on long wires or noisy breadboards
SWD_Speed=5000		# kHz — 5000 is the recommended safe value for most setups
# SWD_Speed=10000	# try only if you have very short, well-grounded connections

Config=$(get_config_name ${Target})

echo "Starting OpenOCD for Raspberry Pi Debug Probe"
echo "OpenOCD used:    ${OPENOCD_ROOT}"
echo "SWD clock speed: ${SWD_Speed} kHz"
echo "==========================================="

${OPENOCD_ROOT}/bin/openocd			\
    -s "${OPENOCD_ROOT}/share/openocd/scripts"	\
    -f "interface/cmsis-dap.cfg"		\
    -f "target/${Config}"			\
    -c "adapter speed ${SWD_Speed}"		\
    -c "transport select swd"			\
    -c "init"					\
    -c "targets"				\
    -c "reset init"				\
    -c "halt"					\
    "$@"

#   -c "cortex_m reset_config sysresetreq"	\
#   -c "rp2350.dap.core1 cortex_m reset_config sysresetreq"

# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
