#!/bin/bash

SESSION_NAME=$1
OPENVPN_DIR="/etc/openvpn"

WINDOW_1_NAME="Openvpn"
tmux new-session -d -s "$SESSION_NAME" -n "$WINDOW_1_NAME"


# Window 1
# Coding workspace and local tests
#_____________________________________________
#|                     |                      |
#|                     |                      |
#|                     |    server            |
#|                     |                      |
#|                     |______________________|
#|                     |                      |
#|      vim            |     misc             |
#|                     |                      |
#|                     |                      |
#|_____________________|______________________|
tmux send-keys "cd $OPENVPN_DIR; $HOME/scripts/list_vpn_servers.sh" C-m
tmux split-window -h

tmux send-keys "cd $OPENVPN_DIR; sudo openvpn /etc/openvpn/uk100.nordvpn.com.tcp443.ovpn" C-m
tmux attach-session -t $SESSION_NAME
