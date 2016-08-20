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
    rm -R -- */
}

function cloneall() {
    git clone https://aur.archlinux.org/gnome-encfs-manager.git
    git clone https://aur.archlinux.org/gtk-theme-arc-git.git
    git clone https://aur.archlinux.org/libgee06.git
    git clone https://aur.archlinux.org/vibrancy-colors.git
    git clone https://aur.archlinux.org/xfce4-pulseaudio-plugin.git
}

function delete_dotgit_dirs() {
    for dir in */ ;
    do
        dir=${dir%*/}
        if [ "$dir" == "." ] || [ "$dir" == ".." ]; then
            continue;
        fi
	    cd $dir
	    rm -rf .git
        echo "delete .git from folder "$dir
        cd ..
    done
}

cleanup
cloneall
delete_dotgit_dirs
