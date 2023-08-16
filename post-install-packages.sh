#! /bin/bash

sudo apt update -y
packages=( zsh vim-gtk tmux git curl guake silversearcher-ag fzf xclip tree gprename)


# jvm stuff
packages=(${packages[@]} maven clojure leiningen)

# dev
packages=(${packages[@]} docker-compose golang docker.io python3-pip meld jq npm)


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
