#! /bin/bash

echo "********************"
echo "Git stuff"
echo "-------------------"
CONFIG_FOLDER="$(dirname "$(realpath "$0")")"
GIT_CONFIG_DESTINATION=$HOME/.gitconfig
echo "Will link $CONFIG_FOLDER/.gitconfig to $GIT_CONFIG_DESTINATION"
if [ ! -f $GIT_CONFIG_DESTINATION ]; then
    ln -s $CONFIG_FOLDER/.gitconfig $GIT_CONFIG_DESTINATION
    echo "file created"
else
    echo "file already exists"
fi
echo "********************"
echo ""


