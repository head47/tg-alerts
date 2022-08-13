#! /bin/bash

sudo /opt/tg-alerts/login.sh

if [[ -n $SSH_ORIGINAL_COMMAND ]] # command given, so run it
then
    exec /bin/bash -c "$SSH_ORIGINAL_COMMAND"
else # no command, so interactive login shell
    exec bash -il
fi
