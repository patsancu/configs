#!/bin/bash

SESSION_NAME=$1
PROJECT_DIR=/home/patrick/

# Window 1
# Coding workspace and local tests
#____________________________________________
#|                                           |
#|                                           |
#|    datos                                  |
#|        SSH                                |
#|                                           |
#|                                           |
#|                                           |
#|                                           |
#|                                           |
#|___________________________________________|
WINDOW_1_NAME="Workspace"
tmux new-session -d -s "$SESSION_NAME" -n "$WINDOW_1_NAME"
tmux send-keys "datosSSH" C-m
tmux split-window -h
tmux send-keys "cd $PROJECT_DIR" C-m

### Select pane and attach to session
tmux select-window -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux select-pane -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux attach-session -t "$SESSION_NAME"
