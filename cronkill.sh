#!/bin/bash

cqexe=$(basename $(find ~/coolq -maxdepth 1 -type f -name '*.exe' | head -n 1))

cqpid=$(ps x | grep $cqexe | head -n 1 | awk '{print $1}')
if ["$cqpid" == ""]; then
    echo "[CQKiller] No CoolQ process found."
else
    echo "[CQKiller] Found CoolQ process, kill it!"
    kill -9 $cqpid
    tail -f /dev/null --pid=$cqpid
fi
