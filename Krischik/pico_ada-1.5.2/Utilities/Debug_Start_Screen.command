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

typeset -f -u debug-get-uart-device
typeset -f -u debug-get-uart-port

typeset Baud_Rate=115200
typeset UART_Device=$(debug-get-uart-device)

print "=== screen Launcher for Raspberry Pi Debug Probe (UART) ==="
print 
print "✅ UART device ready: ${UART_Device} @ ${Baud_Rate} baud"
print 
print "Stop with Ctrl-A K Y"

screen  ${UART_Device} ${Baud_Rate},cs8,-istrip,inlcr,onlcr 

# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
