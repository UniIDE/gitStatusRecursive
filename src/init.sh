#!/bin/bash
file=gitStatusAll.sh
bin_dir=~/.bin/git

mkdir $bin_dir
cp -r sh/$file $bin_dir/
cat sh/.bash_aliases >~/.bash_aliases
