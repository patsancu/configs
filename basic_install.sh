#! /bin/bash

CONFIG_FOLDER=$HOME/configs

# EXTRACT THESE TWO TO A FUNCTION
echo "Will link $CONFIG_FILE to $ZSHRC_DESTINATION if it doesn't exist"
echo "-------------------"
if [ ! -f $ZSHRC_DESTINATION ]; then
    ZSHRC_DESTINATION=$HOME/.zshrc
    echo "********************"
    if [ "${OSTYPE//[0-9.]/}" == "darwin" ]; then
        CONFIG_FILE="$CONFIG_FOLDER/.zshrc_macos"
        echo "$OSTYPE" >> "$HOME/os_patrick.txt"
    else
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            CONFIG_FILE="$CONFIG_FOLDER/.zshrc_linux"
            echo "$OSTYPE" >> "$HOME/os_patrick.txt"
        fi
    fi


    if [ ! -z "$CONFIG_FILE" ]; then
        ln -s $CONFIG_FILE $ZSHRC_DESTINATION
    else
        echo "Config file is empty"
    fi
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
    if [ "${OSTYPE//[0-9.]/}" == "darwin" ]; then
        FILE_TO_COPY="$CONFIG_FOLDER/.vimrc_macos_LINK_ME"
    else
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then
            FILE_TO_COPY="$CONFIG_FOLDER/.vimrc_linux_LINK_ME"
        else
            echo "Not running linux or macos?"
            echo "Hope you're trying bsd, not lsd"
        fi
    fi
    if [ ! -z "$FILE_TO_COPY" ]; then
        ln -s "$FILE_TO_COPY" "$VIMRC_DESTINATION"
        echo "file $VIMRC_DESTINATION created"
    else
        echo "VIMRC_DESTINATION is empty"
    fi
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
if [ -f "$ANTIGEN_FILE" ] &&  [ -n "$(find "$ANTIGEN_FILE" -prune -size +100 )" ]; then
    echo "OK"
else
    curl -L git.io/antigen > $ANTIGEN_FILE
fi
echo "********************"
echo ""


echo "To install useful stuff, run:"
echo
ls post-install-*sh | awk '{print "./" $0}' | xargs | sed "s/ / ; /g"
