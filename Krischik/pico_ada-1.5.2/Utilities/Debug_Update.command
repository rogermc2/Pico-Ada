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
#  Download and install the latest Raspberry Pi Debug Probe firmware
#  Supports: official Debug Probe, Pico 1, and Pico 2
#  Part of the pi-ada-tutorial project
#  https://pi-ada-tutorial.sourceforge.io/
#############################################################################

emulate -L zsh
setopt ERR_EXIT NO_UNSET PIPE_FAIL

# ─────────────────────────────────────────────────────────────────────────────
# Configuration
# ─────────────────────────────────────────────────────────────────────────────

typeset -r PROJECT_HOME="${PROJECT_HOME:-${HOME}/Projects/pi-ada-tutorial}"
typeset -r TEMP_DIR="${PROJECT_HOME}/Temp"
typeset -r Pico_Upload="${Pico_Upload:-/media/RPI-RP2}"
typeset -r Pico2_Upload="${Pico2_Upload:-/media/RPI-RP2350}"

# Latest known good version (update this when a new release appears)
typeset -r DEFAULT_VERSION="2.3.0"

# ─────────────────────────────────────────────────────────────────────────────
# Functions
# ─────────────────────────────────────────────────────────────────────────────

function usage() {
    print -u2 "Usage: ${0:t} [probe|pico1|pico2] [version]"
    print -u2 "       Default: probe ${DEFAULT_VERSION}"
    exit 1
}

function ensure_temp_dir() {
    if [[ ! -d ${TEMP_DIR} ]]; then
        print "Creating temporary directory ${TEMP_DIR} …"
        mkdir -p ${TEMP_DIR}
    fi
}

function ask_pico_type() {
    print "Which device do you want to flash with Debug Probe firmware?"
    print "  1) Official Raspberry Pi Debug Probe"
    print "  2) Raspberry Pi Pico 1 (RP2040)"
    print "  3) Raspberry Pi Pico 2 (RP2350)"
    print -n "Enter 1, 2 or 3 [1]: "
    read -r choice

    case ${choice:-1} in
        1) return 1 ;;   # Debug Probe
        2) return 2 ;;   # Pico 1
        3) return 3 ;;   # Pico 2
        *) print -u2 "Invalid choice."; exit 1 ;;
    esac
}

function get_target_mount() {
    case ${1} in
        1|2) print ${Pico_Upload} ;;
        3)   print ${Pico2_Upload} ;;
        *)   print -u2 "Unknown target type ${1}"; exit 1 ;;
    esac
}

function get_uf2_filename() {
    case ${1} in
        1) print "debugprobe.uf2" ;;
        2) print "debugprobe_on_pico.uf2" ;;
        3) print "debugprobe_on_pico2.uf2" ;;
        *) print -u2 "Unknown target type ${1}"; exit 1 ;;
    esac
}

# ─────────────────────────────────────────────────────────────────────────────
# Main
# ─────────────────────────────────────────────────────────────────────────────

print "=== Raspberry Pi Debug Probe Firmware Downloader ===\n"

# Ask for device type if not supplied on command line
if (( $# >= 1 )); then
    case ${1:l} in
        probe|1)            TARGET=1 ;;
        pico1|pico|2)       TARGET=2 ;;
        pico2|rp2350|3)     TARGET=3 ;;
        *)                  usage ;;
    esac
    shift
else
    ask_pico_type
    TARGET=$?
fi

# Ask for version if supplied, otherwise use default
VERSION=${1:-${DEFAULT_VERSION}}
shift 2>/dev/null || true

MOUNT_POINT=$(get_target_mount ${TARGET})
UF2_NAME=$(get_uf2_filename ${TARGET})

print "Device type : ${TARGET} → ${MOUNT_POINT}"
print "UF2 file    : ${UF2_NAME}"
print "Version     : debugprobe-v${VERSION}\n"

ensure_temp_dir

UF2_FILE="${TEMP_DIR}/${UF2_NAME}"
DOWNLOAD_URL="https://github.com/raspberrypi/debugprobe/releases/download/debugprobe-v${VERSION}/${UF2_NAME}"

# ─────────────────────────────────────────────────────────────────────────────
# Download handling (skip if file already exists)
# ─────────────────────────────────────────────────────────────────────────────

print "Downloading ${UF2_NAME} (v${VERSION}) …"
wget --directory-prefix=${TEMP_DIR} \
     --no-verbose \
     --show-progress \
     "${DOWNLOAD_URL}"

# Check download succeeded
if [[ ! -f ${UF2_FILE} ]]; then
    print -u2 "✗ Download failed – file ${UF2_FILE} not found"
    exit 1
fi

# Basic sanity check on file size (should be > 100 KiB)
if (( $(stat -c %s ${UF2_FILE}) < 100000 )); then
    print -u2 "✗ Downloaded file seems too small – probably corrupt or wrong version"
    rm ${UF2_FILE}
    exit 1
fi

print "✓ Download completed successfully.\n"

# ─────────────────────────────────────────────────────────────────────────────
# Copy to Pico / Debug Probe
# ─────────────────────────────────────────────────────────────────────────────

if [[ ! -d ${MOUNT_POINT} ]]; then
    print -u2 "✗ Mount point not found: ${MOUNT_POINT}"
    print -u2 "  Please connect your device in BOOTSEL mode and try again."
    exit 1
fi

print "Copying firmware to ${MOUNT_POINT} …"
gcp --verbose --preserve=timestamps "${UF2_FILE}" "${MOUNT_POINT}/"
grm --verbose ${UF2_FILE}

print "\n✓ Firmware copied successfully!"
print "  The device should now reboot automatically with debugprobe-v${VERSION}."

if (( TARGET == 1 )); then
    print "\nTip: For the official Debug Probe you can also run"
    print "     'picotool reboot -f' or simply unplug and replug the probe."
fi

# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
