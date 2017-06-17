#!/bin/bash
# This file is part of the Archi3 GNU/Linux distribution
# Copyright (c) 2016 Mike Krüger, 2017 Launay Gaby
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

cur_dir=`pwd`
release_dir=$cur_dir/release
packages_aur_dir=$cur_dir/packages_aur
packages_local_dir=$cur_dir/packages_local

function make_loop() {
    mkdir -p $release_dir
    for dir in $packages_local_dir/* $packages_aur_dir/* ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ] ; then
            continue;
        fi
	cd $dir
	makepkg -f -s -c --nosign
        mv *.pkg.tar.xz $release_dir
        echo "makepkg from "$dir" finished"
        cd $cur_dir
    done
}

function sign_packages(){
    cd $release_dir
    for f in *.pkg.tar.xz
    do
        echo "Signing $f file..."
        gpg --detach-sign --no-armor $f
    done
    cd $cur_dir
}

function create_repo() {
    cd $release_dir
    repo-add archi3repo.db.tar.gz *.pkg.tar.xz
    rm archi3repo.db
    rm archi3repo.files
    cp archi3repo.db.tar.gz archi3repo.db
    cp archi3repo.files.tar.gz archi3repo.files
}

make_loop
#sign_packages
create_repo
