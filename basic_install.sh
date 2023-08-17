#! /bin/bash

CONFIG_FOLDER=$HOME/configs

# EXTRACT THESE TWO TO A FUNCTION
ZSHRC_DESTINATION=$HOME/.zshrc
echo "********************"
echo "Will link zshrc linux to $HOME/.zshrc if it doesn't exist"
echo "-------------------"
if [ ! -f $ZSHRC_DESTINATION ]; then
	ln -s $CONFIG_FOLDER/.zshrc_linux $ZSHRC_DESTINATION
	echo "file created"
else
	echo "file already exists"
fi
echo "********************"
echo ""

EXTRA_CONFIG_FILE=~/.sh_extra_config
[ ! -f $EXTRA_CONFIG_FILE ] && touch $EXTRA_CONFIG_FILE
echo "********************"
echo "You can put a 'source file' in $EXTRA_CONFIG_FILE to load exteranl configs"
echo "********************"
echo ""



echo "********************"
echo "Vim stuff"
echo "-------------------"
VIMRC_DESTINATION=$HOME/.vimrc
if [ ! -f $VIMRC_DESTINATION ]; then
	ln -s $CONFIG_FOLDER/.vimrc_linux_LINK_ME $VIMRC_DESTINATION
	echo "file created"
else
	echo "file already exists"
fi
echo "********************"
echo ""

echo "********************"
echo "Git stuff"
echo "-------------------"
GIT_CONFIG_DESTINATION=$HOME/.gitconfig
if [ ! -f $GIT_CONFIG_DESTINATION ]; then
    ln -s $CONFIG_FOLDER/.gitconfig $GIT_CONFIG_DESTINATION
    echo "file created"
else
    echo "file already exists"
fi
echo "********************"
echo ""


echo "********************"
echo "tmux stuff"
echo "-------------------"
TMUX_CONFIG_DESTINATION=$HOME/.tmux.conf
if [ ! -f $TMUX_CONFIG_DESTINATION ]; then
    ln -s $CONFIG_FOLDER/.tmux.conf.LINK_ME $TMUX_CONFIG_DESTINATION
    echo "file created"
else
    echo "file already exists"
fi
echo "********************"
echo ""

echo "********************"
echo "antigen installation..."
echo "-------------------"
ANTIGEN_FILE=$HOME/antigen.zsh
if [ -f "$ANTIGEN_FILE" ]; then
    echo "OK"
else
    curl -L git.io/antigen > $ANTIGEN_FILE
fi
echo "********************"
echo ""


echo "To install useful stuff, run:"
echo
ls post-install-*sh | awk '{print "./" $0}' | xargs | sed "s/ / ; /g"
