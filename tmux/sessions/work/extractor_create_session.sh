#!/bin/bash

SESSION_NAME=$1
PROJECT_DIR=/home/patrick/dev/tvmetrix/extractor
EXTRACTOR_BUILD_DIR=/home/patrick/dev/tvmetrix/extractor/BUILD_EXTRACTOR



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
WINDOW_2_NAME="extractor machines"
tmux new-window -n "$WINDOW_2_NAME"
tmux send-keys "cd $PROJECT_DIR" C-m
tmux split-window -h
tmux send-keys "cd $PROJECT_DIR" C-m

#tmux select-pane -t $SESSION_NAME:$WINDOW_2_NAME.1
#tmux split-window -v
#tmux send-keys "cd $PROJECT_DIR" C-m
#tmux send-keys "watch -n1 ./kubectl get pods -n tvmetrix" C-m

#tmux select-pane -t $SESSION_NAME:$WINDOW_2_NAME.3
#tmux split-window -v
#tmux send-keys "cd $PROJECT_DIR" C-m
#tmux send-keys "drill-kubectl" C-m


## Window 3: Vim tvmetrix-reports

##____________________________________________________
##|                                                  |
##|                                                  |
##|                                                  |
##|         VIM clojure tvmetrix-reports             |
##|                                                  |
##|                                                  |
##|                                                  |
##|                                                  |
##|                                                  |
##|__________________________________________________|

WINDOW_3_NAME="Build extractor, templates and data"
tmux new-window -n "$WINDOW_3_NAME"
tmux send-keys "cd $BUILD_EXTRACTOR" C-m
tmux split-window -h
tmux send-keys "cd $BUILD_EXTRACTOR/conf/freemarker" C-m
tmux split-window -v
tmux send-keys "cd $BUILD_EXTRACTOR/" C-m

#tmux split-window -h
#tmux send-keys "cd $PROJECT_DIR/tvmetrix-reports" C-m
#tmux send-keys "lein repl" C-m



## Window 4: Vim tvmetrix-reports

##____________________________________________________
##|                                                  |
##|                                                  |
##|                                                  |
##|         VIM tvmetrix-k8s
##|                                                  |
##|                                                  |
##|                                                  |
##|                                                  |
##|                                                  |
##|__________________________________________________|

#WINDOW_4_NAME="tvmetrix-k8s"
#tmux new-window -n $WINDOW_4_NAME
#tmux send-keys "cd $PROJECT_DIR/tvmetrix-k8s" C-m
#tmux send-keys "vim" C-m
#tmux send-keys ",n" C-m

### Select pane and attach to session
tmux select-window -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux select-pane -t $SESSION_NAME:$WINDOW_1_NAME.1
tmux attach-session -t "$SESSION_NAME"
