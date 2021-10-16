#!/usr/bin/env bash

sudo groupadd docker
sudo usermod -aG docker $USER
echo "Log out and then run:"
echo "  docker run hello-world"


