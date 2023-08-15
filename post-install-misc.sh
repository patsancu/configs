#! /bin/bash

echo "********************"
echo "fonts"
echo "-------------------"
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts \
    && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fc-cache -rv
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
