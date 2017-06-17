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

function cleanup() {
    rm -Rrf packages
    mkdir -p packages
}

function cloneall() {
    cd packages
    git clone https://aur.archlinux.org/mkinitcpio-openswap.git
    git clone https://aur.archlinux.org/qt5-styleplugins.git
    git clone https://aur.archlinux.org/packer.git
    git clone https://aur.archlinux.org/python-snakeviz.git
    git clone https://aur.archlinux.org/freedns-daemon.git
    git clone https://aur.archlinux.org/i3blocks.git
    git clone https://aur.archlinux.org/mu.git
    git clone https://aur.archlinux.org/git-lfs.git
    git clone https://aur.archlinux.org/i3lock-color.git
    git clone https://aur.archlinux.org/wordnet.git
    cd ..
}

function delete_dotgit_dirs() {
    cd packages
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ]; then
            continue;
        fi
	    cd $dir
	    rm -rf .git*
        echo "delete .git from folder "$dir
        cd ..
    done
    cd ..
}

cleanup
cloneall
delete_dotgit_dirs
