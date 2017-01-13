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
    mv *.pkg.tar.xz ../upload
}

function make_loop() {
    mkdir upload
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ]; then
            continue;
        fi
	    cd $dir
	    makepkg -f -s -c
        copyto_upload_dir
        echo "makepkg from "$dir" finished"
        cd ..
    done
}

function sign_packages(){
    gpg --detach-sign --no-armor upload/*.pkg.tar.xz
}

function create_repo() {
    repo-add --sign upload/swagarchrepo.db.tar.gz upload/*.pkg.tar.xz

}

make_loop
sign_packages
create_repo
