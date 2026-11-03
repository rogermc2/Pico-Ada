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

# File: scripts/coolterm-start.zsh
# Purpose: Find the Raspberry Pi Debug Probe UART port on macOS and launch CoolTerm
# Author: Markus (following the "no magic" rule)

setopt Err_Return No_Unset Pipe_Fail Extended_Glob

emulate -L zsh
zmodload zsh/datetime
typeset -f -u debug-get-uart-port

typeset Baut_Rate=115200
typeset Cool_Term_Settings="${PROJECT_HOME}/Library/Pico_Debugger.CoolTermSettings"
typeset UART_Port=$(debug-get-uart-port)
typeset Capture_Path
typeset Capture_File

print "=== CoolTerm Launcher for Raspberry Pi Debug Probe (UART) ==="
print 
print "✅ UART device ready: ${UART_Port} @ ${Baut_Rate} baud"

strftime -s Timestamp "%Y%m%d_%H%M%S" ${EPOCHSECONDS}

Capture_Path="${PROJECT_HOME}/Temp"
Capture_File="CoolTerm_Capture_${Timestamp}.log"

gmkdir ${Capture_Path}

print "Capture     => ${Capture_Path}/${Capture_File}"

# Step 5: Launch CoolTerm with the correct port
# CoolTerm itself is a GUI app; we open it and rely on the user to select the port,
# but we can at least print clear instructions and optionally copy the name to clipboard.

print 
print "Update CoolTerm settings: ${Cool_Term_Settings}"

setopt No_Err_Return

ex -n --clean "${Cool_Term_Settings}" <<-EOF
% substitute /^Port\s*=.*$/Port = ${UART_Port}/e
% substitute /^BaudRate\s*=.*$/BaudRate = ${Baut_Rate}/e
% substitute !^CapturePath\s*=.*$!CapturePath = ${Capture_Path}!e
% substitute /^CaptureAutoFilename\s*=.*$/CaptureAutoFilename = ${Capture_File}/e
exit
EOF

setopt Err_Return

print 
print "Launching CoolTerm..."

open "${Cool_Term_Settings}"

# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
