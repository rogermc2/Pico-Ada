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

setopt No_XTrace
setopt No_Verbose
setopt SH_Word_Split
setopt Err_Exit
setopt CSH_Null_Glob

test -n "${Web_Server}"
test -n "${Homepage}"
rsync				\
  --archive			\
  --update			\
  --verbose			\
  --keep-dirlinks		\
  --exclude='*/.backups'	\
  --exclude='*/.flock'		\
  --exclude='*/.lastmod'	\
  --exclude='**/.cache'		\
  --exclude='*/.linkindex'	\
  --exclude='*/.pageindex'	\
  --exclude='*/.thumbnails'	\
  --exclude='.backups'		\
  --exclude='.DS_Store'		\
  --exclude='.svn'		\
  --exclude='.thumbnails'	\
  --exclude='CVS'		\
  --exclude='session'		\
  --exclude='sessions'		\
  "${Web_Server}/."		\
  "${Homepage}/."

########################################################### {{{1 ###########
# vim: textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab
# vim: fileformat=unix filetype=zsh fileencoding=utf-8 fileformat=unix
