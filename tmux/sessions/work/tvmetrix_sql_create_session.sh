#!/bin/bash

SESSION_NAME=$1
PROJECT_DIR=/home/patrick/dev/tvmetrix

WINDOW_1_NAME="Workspace"
tmux new-session -d -s "$SESSION_NAME" -n "$WINDOW_1_NAME"


# Window 1
# Coding workspace and local tests
#_____________________________________________
#|                     |                      |
#|                     |                      |
#|                     |    tvmetrix-sql      |
#|                     |                      |
#|                     |______________________|
#|                     |                      |
#|      vim            |     tvmetrix-reports |
#|                     |                      |
#|                     |                      |
#|_____________________|______________________|
tmux send-keys "cd $PROJECT_DIR/tvmetrix-sql; vim ." C-m
tmux split-window -h
tmux send-keys -t $SESSION_NAME.1 "cd $PROJECT_DIR/tvmetrix-sql; clear" C-m
tmux split-window -v
tmux send-keys -t $SESSION_NAME.2 "cd $PROJECT_DIR/tvmetrix-reports; clear" C-m

# Window 2: proxy tvmetrix kubectl,
#               alluxio, drill remote
#             and kubectl get pods
#____________________________________________________
#|                         |                        |
#|                         |                        |
#|     proxy               |    alluxio             |
#|                         |                        |
#|_________________________|________________________|
#|                         |                        |
#|watch -n1 kubect get pods|     drill              |
#|                         |                        |
#|                         |                        |
#|_________________________|________________________|
WINDOW_2_NAME="proxy,drill,alluxio"
tmux new-window -n $WINDOW_2_NAME
tmux send-keys "cd $PROJECT_DIR/tvmetrix-k8s" C-m
tmux send-keys "./tvmetrix proxy" C-m
tmux split-window -h
tmux send-keys "cd $PROJECT_DIR" C-m
tmux send-keys "alluxioKubectl"

tmux select-pane -t $SESSION_NAME:$WINDOW_2_NAME.0
tmux split-window -v
tmux send-keys "cd $PROJECT_DIR" C-m
tmux send-keys "watch -n1 ./kubectl get pods --all-namespaces" C-m

tmux select-pane -t $SESSION_NAME:$WINDOW_2_NAME.2
tmux split-window -v
tmux send-keys "cd $PROJECT_DIR" C-m
tmux send-keys "drillKubectl" C-m


# Window 3: VIM, tvmetrix-reports, tvmetrix-sql
#
#
#____________________________________________________
#|                         |                        |
#|                         |                        |
#|     VIM                 |    tvmetrix-reports    |
#|                         |                        |
#|                         |________________________|
#|                         |                        |
#|                         |     tvmetrix-sql       |
#|                         |                        |
#|                         |                        |
#|_________________________|________________________|


# Window 4: Vim tvmetrix-reports

#____________________________________________________
#|                                                  |
#|                                                  |
#|                                                  |
#|         VIM clojure tvmetrix-reports             |
#|                                                  |
#|                                                  |
#|                                                  |
#|                                                  |
#|                                                  |
#|__________________________________________________|




tmux select-window -t $SESSION_NAME:$WINDOW_1_NAME.0
tmux select-pane -t $SESSION_NAME:$WINDOW_1_NAME.0
tmux attach-session -t "$SESSION_NAME"