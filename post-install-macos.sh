#!/usr/bin/env bash

packages=( zsh coreutils tmux just watch)

for package in "${packages[@]}"; do
    brew install $package
done
