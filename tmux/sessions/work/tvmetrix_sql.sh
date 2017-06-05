#!/bin/bash

SESSION_NAME=tvmetrix-sql

## Create session named tvmetrix-sql and detach from it
tmux has-session -t $SESSION_NAME 2>/dev/null
if [ "$?" -eq 1 ] ; then
    echo "No Session found.  Creating and configuring."
    source ~/Configs/tmux/sessions/work/tvmetrix_sql_create_session.sh $SESSION_NAME
else
    echo "Session found.  Connecting."
    tmux attach-session -t $SESSION_NAME
fi