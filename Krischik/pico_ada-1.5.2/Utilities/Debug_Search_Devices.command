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

system_profiler SPUSBDataType 2>/dev/null | ggrep --after-context=11 "Debug Probe (CMSIS-DAP)"

############################################################ {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding= fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en :
