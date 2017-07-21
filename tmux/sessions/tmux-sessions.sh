#!/bin/bash

SESSION_NAME=$1
TMUX_SESSIONS_FOLDER=~/Configs/tmux/sessions

# Paths where ~/Configs/tmux/sessions/tmux-session.sh
# will look for a session name passed as a parameter
TMUX_SESSION_ENVIRONMENTS="work dev"
for i in $TMUX_SESSION_ENVIRONMENTS; do
    echo $i
done

## Create session named tvmetrix-sql and detach from it
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ "$?" -eq 1 ] ; then
    echo "No Session found.  Creating and configuring."
    POSSIBLE_SESSION_SCRIPT=$TMUX_SESSIONS_FOLDER/$TMUX_SESSION_ENV/"$SESSION_NAME"-create_session.sh;
    echo "Will try with default env: $TMUX_SESSION_ENV"
    echo "path would be: $POSSIBLE_SESSION_SCRIPT"
    if [[ -f $POSSIBLE_SESSION_SCRIPT ]]; then
       source $POSSIBLE_SESSION_SCRIPT;
       exit 0;
    else
        echo "Not found"
        echo "TMUX_SESSION_ENVIRONMENTS: $TMUX_SESSION_ENVIRONMENTS"
        for env in $TMUX_SESSION_ENVIRONMENTS; do
            echo "Will try with $POSSIBLE_SESSION_SCRIPT"
            POSSIBLE_SESSION_SCRIPT=$TMUX_SESSIONS_FOLDER/$env/"$SESSION_NAME"-create_session.sh
            if [[ -f $POSSIBLE_SESSION_SCRIPT ]]; then
               source $POSSIBLE_SESSION_SCRIPT;
               exit 0;
            fi
        done
    fi
    echo "Something terribly weird happened";
else
    echo "Session found.  Connecting.";
    tmux attach-session -t $SESSION_NAME;
fi
