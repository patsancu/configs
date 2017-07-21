#!/bin/bash

SESSION_NAME=$1
PROJECT_DIR="~/dev/python/django/proyectopisos"


WINDOW_1_NAME="Workspace"
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
tmux send-keys "workon prueba_pisos ; cd $PROJECT_DIR" C-m
tmux send-keys "vim ." C-m
tmux split-window -h

tmux send-keys -t $SESSION_NAME.2 "workon prueba_pisos" C-m
tmux send-keys -t $SESSION_NAME.2 "cd $PROJECT_DIR/; " C-m
tmux send-keys -t $SESSION_NAME.2 "python manage.py runserver"
tmux split-window -v
tmux send-keys -t $SESSION_NAME.3 "cd $PROJECT_DIR; git status" C-m

# Window 2
# Coding workspace and local tests
#______________________________________________
#|                                            |
#|                                            |
#|                                            |
#|                                            |
#|                                            |
#|                                            |
#|      vim  notes                            |
#|                                            |
#|                                            |
#|____________________________________________|

### Second window
WINDOW_2_NAME="Notes"
tmux new-window -n "$WINDOW_2_NAME"
tmux send-keys -t $SESSION_NAME:$WINDOW_2_NAME.1 " cd $PROJECT_DIR/.." C-m
tmux send-keys -t $SESSION_NAME:$WINDOW_2_NAME.1 "vim Afaire_pisos.md" C-m


tmux select-window -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux select-pane -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux attach-session -t $SESSION_NAME
