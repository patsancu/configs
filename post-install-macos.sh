#!/usr/bin/env bash

packages=( zsh coreutils tmux just watch meld npm)

for package in "${packages[@]}"; do
    brew install $package
done
