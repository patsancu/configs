#!/bin/bash

hash ipython 1>&2 2>/dev/null
if [ $? -eq 1 ]; then
    echo "ipython not installed"
else
    SESSION_NAME=$1
    TESTS_DIR="~/dev/python/$(date +'%Y%m%d_%H%M%S')"

    WINDOW_1_NAME="Workspace"
    tmux new-session -d -s "$SESSION_NAME" -n "$WINDOW_1_NAME"

    # Window 1
    # Coding workspace and local tests
    #_____________________________________________
    #|                     |                      |
    #|                     |                      |
    #|                     |                      |
    #|                     |                      |
    #|                     |       ipython        |
    #|                     |                      |
    #|      vim            |                      |
    #|                     |                      |
    #|                     |                      |
    #|_____________________|______________________|
    mkdir $TESTS_DIR

    tmux send-keys -t $SESSION_NAME.2 "cd $TESTS_DIR" C-m
    tmux send-keys "vim" C-m
    tmux split-window -h

    tmux send-keys -t $SESSION_NAME.2 "cd $TESTS_DIR" C-m
    tmux send-keys -t $SESSION_NAME.2 "ipython" C-m

    tmux select-window -t $SESSION_NAME:$WINDOW_1_NAME.1
    tmux select-pane -t $SESSION_NAME:$WINDOW_1_NAME.1
    tmux attach-session -t $SESSION_NAME
fi
