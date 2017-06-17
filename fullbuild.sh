#!/bin/bash
# This file is part of the SwagArch GNU/Linux distribution
# Copyright (c) 2016 Mike Krüger
# 
# This program is free software: you can redistribute it and/or modify  
# it under the terms of the GNU General Public License as published by  
# the Free Software Foundation, version 3.
#
# This program is distributed in the hope that it will be useful, but 
# WITHOUT ANY WARRANTY; without even the implied warranty of 
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License 
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#

function copyto_upload_dir() {
    mv *.pkg.tar.xz ../release
}

function make_loop() {
    mkdir release
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ] || [ "$dir" == "release" ]; then
            continue;
        fi
	    cd $dir
	    makepkg -f -s -c --nosign
        copyto_upload_dir
        echo "makepkg from "$dir" finished"
        cd ..
    done
}

function sign_packages(){
    cd release
    FILES=*.pkg.tar.xz
    for f in $FILES
    do
        echo "Signing $f file..."
        gpg --detach-sign --no-armor $f
    done

    cd ..
}

function create_repo() {
    repo-add release/archi3repo.db.tar.gz release/*.pkg.tar.xz
}

make_loop
sign_packages
create_repo
