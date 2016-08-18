#!/bin/bash

cd gnome-encfs-manager
makepkg -f -s -c
cd ..

cd gtk-theme-arc-git
makepkg -f -s -c
cd ..

cd vibrancy-colors
makepkg -f -s -c
cd ..

cd xfce4-pulseaudio-plugin
makepkg -f -s -c
cd ..

echo "finished!"
