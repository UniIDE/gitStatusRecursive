#!/bin/bash
file=gitStatusAll.sh
bin_dir=~/.bin/git

mkdir -p $bin_dir
cp -r $file $bin_dir/
cat .bash_aliases >~/.bash_aliases
