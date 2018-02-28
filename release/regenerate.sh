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

cur_dir=$(pwd)
release_dir=$cur_dir/release
packages_git_file=$cur_dir/packages/git-packages
packages_snap_dir=$cur_dir/tmp
packages_local_dir=$cur_dir/packages/packages_local

function create_repo() {
    echo "\n+++ Updating database"
    cd "$release_dir"
    repo-add archi3repo.db.tar.gz *.pkg.tar.xz
    rm archi3repo.db
    rm archi3repo.files
    cp archi3repo.db.tar.gz archi3repo.db
    cp archi3repo.files.tar.gz archi3repo.files
}

create_repo
