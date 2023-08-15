#! /bin/bash

packages=( zsh vim tmux git curl guake silversearcher-ag fzf xclip)


# java stuff
packages=(${packages[@]} maven)

# dev
packages=(${packages[@]} docker-compose golang docker.io python3-pip meld jq)

# for YouCompleteMe (vim)
packages=(${packages[@]} build-essential cmake vim-nox python3-dev)

for package in "${packages[@]}"; do
    echo "Will install package: $package"
    sudo apt install -y $package
done

PACKAGE_GREP=$(echo "${packages[@]}" | tr ' ' '|')

echo "**********"
echo "Not installed packages:"
echo "**********"
for package in "${packages[@]}"; do
    dpkg -s $package >/dev/null | grep "not installed" > /dev/null && echo -n "$package"
done
