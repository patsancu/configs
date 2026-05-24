#! /bin/bash

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


