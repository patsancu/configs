#!/usr/bin/env bash

packages=( zsh coreutils tmux just watch meld npm imagemagick ag wget gpg)
packages=(${packages[@]} xpaint)
packages=(${packages[@]} ghostscript) # for imagemagick
packages=(${packages[@]} glow) # for fancy rendering of markdown, like "less"
packages=(${packages[@]} gh)

# macos' bash is veeery old
packages=(${packages[@]} bash)

for package in "${packages[@]}"; do
    brew install $package
done
