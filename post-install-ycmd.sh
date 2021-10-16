#!/usr/bin/env bash

cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
