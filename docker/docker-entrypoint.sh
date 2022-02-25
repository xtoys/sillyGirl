#!/bin/bash

set -e

/app/sillyGirl -d 2>&1 >/dev/null
echo "silly-girl: service started, have fun"

[[ ! -f tasklist ]] && touch tasklist
[[ $(cat tasklist) != $(crontab -l) ]] && crontab tasklist 

exec crond -f "$@"