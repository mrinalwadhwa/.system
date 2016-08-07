#!/usr/bin/env bash

# --------- Shell ---------

touch ".hushlogin"

rm -f ".bashrc"
ln -s "${HOME}/.system/dotfiles/.bashrc"

rm -f ".bash_profile"
ln -s "${HOME}/.system/dotfiles/.bash_profile"
