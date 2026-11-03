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

test -n "${Homepage}"
test -n "${Web_Server}"

read -k1 -s "Key?Clean local Homepage (Y/N): "
echo
if test "${Key:u}" = "Y"; then
    rm -v -r "${Homepage}/htdocs"
fi; unset Key

gmkdir --parents "${Homepage}/htdocs"

read -k1 -s "Key?Clean remote Homepage (Y/N): "
echo
if test "${Key:u}" = "Y"; then
    Delete="--delete"
else
    Delete=""
fi; unset Key

read -k1 -s "Key?Build gnatdoc (Y/N): "
echo
if test "${Key:u}" = "Y"; then
    echo "### Build and copy gnatdoc"

    for I in		\
	"pico_ada_doc"	\
	"pico2_ada_doc"		
    do
	pushd "${Homepage_Worktree}/${I}"
	    gmake doc

	    gmkdir --parents "${Homepage}/htdocs/gnatdoc/${I}/."

	    gcp								\
		--recursive						\
		--target-directory="${Homepage}/htdocs/gnatdoc/${I}/."  \
		"obj/release/gnatdoc/."
	popd
    done; unset I

    echo "### Generate sitemap"

    pushd ${Homepage}/htdocs/gnatdoc
	ls -1 */index.html						\
	| sed 's|^|https://pi-ada-tutorial.sourceforge.io/gnatdoc/|'	\
	| sed 's|/index\.html$|/|'					\
	> ${Homepage_Worktree}/Documents/static/sitemap.txt

    popd
fi; unset Key

echo "### Build and copy hugo"

make -C "${Homepage_Worktree}/Documents" all

test -n "${Homepage}"
test -n "${Web_Server}"
rsync				\
    ${Delete}			\
    --archive			\
    --delete-excluded		\
    --keep-dirlinks		\
    --update			\
    --verbose			\
    --exclude='*/.backups'	\
    --exclude='*/.flock'	\
    --exclude='*/.thumbnails'	\
    --exclude='*.swp'		\
    --exclude='.~lock.*#'	\
    --exclude='.DS_Store'	\
    --exclude='.backups'	\
    --exclude='.thumbnails'	\
    "${Homepage}/."		\
    "${Web_Server}/."

########################################################### {{{1 ###########
# vim: set textwidth=0 nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set filetype=zsh fileencoding=utf-8 fileformat=unix foldmethod=marker :
# vim: set nospell spelllang=en_gb :
