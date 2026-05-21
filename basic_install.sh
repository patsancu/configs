#! /bin/bash

CONFIG_FOLDER=$HOME/configs

mkdir -p ~/scripts

echo "-------------------"
echo "zsh config"
echo "-------------------"
ZSHRC_DESTINATION=$HOME/.zshrc
echo "********************"
if [ "${OSTYPE//[0-9.]/}" == "darwin" ]; then
    [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

    KEY_REPEAT_CONFIG_FILE="$CONFIG_FOLDER/macos/key_repeat_config.sh"
    echo "Loading key repeat config from ${KEY_REPEAT_CONFIG_FILE}"
    [ -f $KEY_REPEAT_CONFIG_FILE ] && source $KEY_REPEAT_CONFIG_FILE # This should be moved to zsh macos

    CONFIG_FILE="$CONFIG_FOLDER/.zshrc_macos"
else
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        CONFIG_FILE="$CONFIG_FOLDER/.zshrc_linux"
    fi
fi


if [ ! -z "$CONFIG_FILE" ]; then
    if [ ! -f $VIMRC_DESTINATION ]; then
        ln -s $CONFIG_FILE $ZSHRC_DESTINATION
        echo "file created"
    fi
else
    echo "Config file is empty"
fi

echo "********************"
echo ""

EXTRA_CONFIG_FILE=~/.sh_extra_config
[ ! -f $EXTRA_CONFIG_FILE ] && touch $EXTRA_CONFIG_FILE
echo "********************"
echo "You can put a 'source file' in $EXTRA_CONFIG_FILE to load external configs"
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

echo "********************"
echo "ghostty stuff"
echo "-------------------"

XDG_CONFIG_HOME=$HOME/.config

GHOSTTY_CONFIG_DESTINATION=$XDG_CONFIG_HOME/ghostty/config.ghostty
if [ ! -f $GHOSTTY_CONFIG_DESTINATION ]; then
    ln -s $CONFIG_FOLDER/ghostty/config $GHOSTTY_CONFIG_DESTINATION
    echo "file created"
else
    echo "file already exists, won't do anything"
fi
echo "********************"


echo ""

echo ""
echo "********************"
echo "starship installation..."
echo "-------------------"
if command -v starship &> /dev/null; then
    echo "starship already installed"
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

STARSHIP_CONFIG_DEST=$HOME/.config/starship.toml
if [ ! -f "$STARSHIP_CONFIG_DEST" ]; then
    mkdir -p "$HOME/.config"
    ln -s "$CONFIG_FOLDER/zsh/starship.toml" "$STARSHIP_CONFIG_DEST"
    echo "starship.toml symlink created"
else
    echo "starship.toml already exists"
fi
echo "********************"
echo "zsh-syntax-highlighting..."
echo "-------------------"
if [ -d ~/.zsh-syntax-highlighting ]; then
    echo "already installed"
else
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh-syntax-highlighting
fi
echo "********************"

echo "For everything to work fine, create an ssh key if not existing yet"
echo 'ssh-keygen -t ed25519 -C "your_email@example.com"'
echo eval "$(ssh-agent -s)"
echo ssh-add ~/.ssh/id_ed25519
echo "Then,go ahead an paste the ssh key of the new machine here: https://github.com/settings/keys"
echo cat ~/.ssh/id_ed25519.pub


echo "To install useful stuff, run:"
echo
ls post-install-*sh | awk '{print "./" $0}' | xargs | sed "s/ / ; /g"
