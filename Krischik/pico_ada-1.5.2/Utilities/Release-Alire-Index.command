#!/opt/local/bin/zsh
############################################################# {{{1 ##########
#  Copyright © 2019 … 2020 Martin Krischik «krischik@users.sourceforge.net»
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
#  along with this program.  If not, see «http://www.gnu.org/licenses/».
############################################################# }}}1 ##########

setopt No_XTrace
setopt Err_Exit

typeset in_Version="${1}"
typeset in_Descripion="${2}"

pushd "${PROJECT_HOME}"
    typeset -a Crates=(pico_xbsp pico_ada_c*)

    # Optional: check we actually found something
    if (( $#Crates == 0 )); then
        print "No matching crates found" >&2
        return 1
    fi

    pushd "Library/alire-index"
        git status
        echo """
This script will create a new release branches for version «${in_Version}»

The alire-index must be clean for this to work."""

        git checkout    "stable-1.4.0"
        git pull
        git checkout -b "release/${in_Version}"

        for I in "${Crates[@]}"; do
            gmkdir --parents "index/${I:0:2}/${I}/"
            gcp --verbose "../../Downloads/Alire/${I}-${in_Version}.toml" "index/${I:0:2}/${I}/"
            git add "index/${I:0:2}/${I}/${I}-${in_Version}.toml"
        done; unset I

        git commit -m"Pi Ada Tutorial release ${in_Version}

${in_Descripion}
"
        git push --set-upstream origin release/${in_Version}

        open "https://github.com/alire-project/alire-index/pulls"
    popd
popd


############################################################ {{{1 ###########
# vim: set nowrap tabstop=8 shiftwidth=4 softtabstop=4 expandtab :
# vim: set textwidth=0 filetype=zsh foldmethod=marker nospell :
