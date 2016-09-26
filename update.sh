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
    rm -Rrf -- */
}

function cloneall() {
    git clone https://github.com/SwagArch/swagarch-keyring.git
    git clone https://aur.archlinux.org/gnome-encfs-manager.git
    git clone https://aur.archlinux.org/gtk-theme-arc-git.git
    git clone https://aur.archlinux.org/libgee06.git
    git clone https://aur.archlinux.org/vibrancy-colors.git
    git clone https://aur.archlinux.org/xfce4-pulseaudio-plugin.git
    git clone https://aur.archlinux.org/package-query.git
    git clone https://aur.archlinux.org/yaourt.git
    git clone https://aur.archlinux.org/pamac-aur.git
    git clone https://aur.archlinux.org/mac-os-lion-cursors.git 
    git clone https://aur.archlinux.org/plank-theme-arc.git
    git clone https://aur.archlinux.org/arc-firefox-theme-git.git
    git clone https://aur.archlinux.org/mkinitcpio-openswap.git
    git clone https://aur.archlinux.org/ckbcomp.git
    git clone https://aur.archlinux.org/qt5-styleplugins.git
    git clone https://aur.archlinux.org/qgnomeplatform-git.git 

    #Get calamares package
    mkdir calamares
    cd calamares
    wget https://raw.githubusercontent.com/SwagArch/calamares-configs/master/pkg/PKGBUILD
    cd ..

    #Get swagarch-wallpapers package
    mkdir swagarch-wallpapers
    cd swagarch-wallpapers
    wget https://raw.githubusercontent.com/SwagArch/swagarch-wallpapers/master/PKGBUILD
    wget https://raw.githubusercontent.com/SwagArch/swagarch-wallpapers/master/swagarch-wallpapers.install
    cd ..

    #Get swagarch-base-skel package
    mkdir swagarch-base-skel
    cd swagarch-base-skel
    wget https://raw.githubusercontent.com/SwagArch/desktop-settings/master/pkg/PKGBUILD
    wget https://raw.githubusercontent.com/SwagArch/desktop-settings/master/pkg/swagarch-base-skel.install
    cd ..

    #Get light-locker-settings
    mkdir light-locker-settings
    cd light-locker-settings
    wget https://raw.githubusercontent.com/Antergos/antergos-packages/master/antergos/light-locker-settings/PKGBUILD
    cd ..
    
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
