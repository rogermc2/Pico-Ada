############################################################# {{{1 ##########
#  Copyright © 2012 … 2020 Martin Krischik «krischik@users.sourceforge.net»
#############################################################################
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program.  If not, see «http://www.gnu.org/licenses/».
############################################################# }}}1 ##########

.PHONY: all clean run-hugo run-remote build-sourceforge build-krischik

Sourceforge_Options := --destination="${Homepage}/htdocs"

all: ${Homepage}/htdocs
	hugo --theme="congo"  $(Sourceforge_Options)

clean:
	-rm -r public
	-rm -r resources
	-hugo mod clean

run-hugo:
	open "http://localhost:1313/"
	hugo server

run-local:
	hugo --theme="congo" $(Sourceforge_Options)
	open "file://${Homepage}/htdocs/index.html"

run-remote:
	open "https://pi-ada-tutorial.sourceforge.net/"


update-hugo:
	hugo mod get -u ./...
	git submodule update --remote --merge

${Homepage}/htdocs:
	mkdir -p "${Homepage}/htdocs"
	mkdir -p "${Homepage}/cgi-bin"

############################################################# {{{1 ##########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 noexpandtab :
# vim: set textwidth=0 filetype=make foldmethod=marker nospell :
