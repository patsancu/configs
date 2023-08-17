#! /bin/bash

echo "********************"
echo "fonts"
echo "-------------------"

FONT_URL=https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/DroidSansMNerdFont-Regular.otf
FONT_NAME=$(echo $FONT_URL | rev | cut -d '/' -f 1 | rev)
FONT_FOLDER="$HOME/.local/share/fonts"
mkdir -p $FONT_FOLDER
if [ -f "$FONT_FOLDER/$FONT_NAME" ]; then
    echo "Font already downloaded, nothing to do"
else
    echo "$FONT_FOLDER/$FONT_NAME doesn't exist"
    echo "Will download"
    mkdir -p "$FONT_FOLDER" && cd "$FONT_FOLDER" && curl -fLO $FONT_URL
    fc-cache -rv
fi
echo "********************"

echo "********************"
echo "rtx"
echo "-------------------"

if hash rtx &> /dev/null; then
    echo "rtx already installed, will do nothing"
else
    echo "will install rtx"
    echo "-------------------"
    curl https://rtx.pub/install.sh | sh
fi


echo "********************"
echo "makedeb"
echo "-------------------"
# makedeb
if hash makedeb &> /dev/null; then
    echo "makedeb already installed, will do nothing"
else
    wget -qO - 'https://proget.makedeb.org/debian-feeds/makedeb.pub' | gpg --dearmor | sudo tee /usr/share/keyrings/makedeb-archive-keyring.gpg 1> /dev/null
    echo 'deb [signed-by=/usr/share/keyrings/makedeb-archive-keyring.gpg arch=all] https://proget.makedeb.org/ makedeb main' | sudo tee /etc/apt/sources.list.d/makedeb.list
    sudo apt update
    sudo apt install -y makedeb
fi
echo "********************"
