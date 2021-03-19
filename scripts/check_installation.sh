#!/usr/bin/env bash

echo "==================="
echo "Will check tmux plugins..."
echo "-------------------"
TMUX_PLUGINS_FOLDER=~/.tmux/plugins/tpm
if [ ! -d "$TMUX_PLUGINS_FOLDER" ]; then
    echo "tpm not installed"
    echo
    echo "To install:"
    echo "git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGINS_FOLDER"
else
    echo "OK"
fi


echo "==================="
echo "Will check FZF..."
echo "-------------------"
FZF_FOLDER=$HOME/.fzf
if [ ! -d "$FZF_FOLDER" ]; then
    echo "fzf not installed. "
    echo
    echo "to install:"
    echo "  git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_FOLDER"
    echo "  ~/.fzf/install"
else
    echo "OK"
fi

echo "==================="
echo "Will check vim plug..."
echo "-------------------"
PLUG_FILE="$HOME/.vim/autoload/plug.vim"
if [ ! -f "$PLUG_FILE" ]; then
    echo "Vim plug not installed. Path $PLUG_FILE not existing"
    echo
    echo "to install:"
    echo "  curl -fLo $PLUG_FILE --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
else
    echo "OK"
fi


echo "==================="
echo "Will check privateconfigs folder..."
echo "-------------------"
PRIVATE_CONFIG_PATH=~/privateconfigs/
if [ -f $PRIVATE_CONFIG_PATH ]; then
    source $PRIVATE_CONFIG_PATH
    echo "OK"
else
    echo "you can put private stuff at $PRIVATE_CONFIG_PATH"
fi

echo "==================="
echo "Will check extra config..."
echo "-------------------"
EXTRA_CONFIG_FILE=~/.sh_extra_config
if [ -f $EXTRA_CONFIG_FILE ]; then
    source $EXTRA_CONFIG_FILE
    echo "OK"
else
    echo "you can put extra stuff at $PRIVATE_CONFIG_PATH"
fi



echo "==================="
echo "Will check antigen installation..."
echo "-------------------"
ANTIGEN_FILE=~/scripts/antigen.zsh
if [ -f "$ANTIGEN_FILE" ]; then
    echo "OK"
else
    source "$ANTIGEN_FILE"
    echo "$ANTIGEN_FILE does not exist"
    echo "To install:"
    echo "curl -L git.io/antigen > $ANTIGEN_FILE"
fi
