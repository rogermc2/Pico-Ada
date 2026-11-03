#!/usr/bin/osascript
------------------------------------------------------------ {{{1 -----------
--  Copyright © 2007 … 2023 Martin Krischik
-----------------------------------------------------------------------------
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
--
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
--
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
------------------------------------------------------------ }}}1 -----------

set |PROJECT NAME| to (system attribute "PROJECT_NAME")
set |PROJECT HOME| to (system attribute "PROJECT_HOME")
set |MODULE NAME|  to (system attribute "MODULE_NAME")

if the length of |PROJECT NAME| = 0 then
    set |PROJECT NAME| to "Pi-Ada-Tutorial"
end if

if the length of |PROJECT HOME| = 0 then
    set |PROJECT HOME| to "/Work/Projects/" & |PROJECT NAME|
end if

tell application "Terminal"
    set |Tab| to do script "
typeset -x -g MODULE_NAME=\"" & |MODULE NAME| & "\";
typeset -x -g PROJECT_NAME=\"" & |PROJECT NAME| & "\";
source \"" & |PROJECT HOME| & "/Utilities/Setup.command\";
cd \"" & |PROJECT HOME| & "/" & |MODULE NAME| & "\""
    set current settings		of |Tab| to settings set (|PROJECT NAME|)
    set font size			of |Tab| to 16
    set background color		of |Tab| to {55335, 46920, 49215}
    set custom title			of |Tab| to (|PROJECT NAME| & " – " & |MODULE NAME|)
    set title displays device name	of |Tab| to false
    set title displays shell path	of |Tab| to false
    set title displays window size	of |Tab| to false
    set title displays file name	of |Tab| to true
    set number of rows			of |Tab| to 50
    set number of columns		of |Tab| to 160
end tell

------------------------------------------------------------ {{{1 -----------
-- vim: set wrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab nospell :
-- vim: set textwidth=0 fileencoding=utf8 fileformat=unix filetype=applescript foldmethod=marker :
