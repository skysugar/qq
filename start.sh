#!/bin/bash

trap 'exit 1' HUP INT PIPE QUIT TERM

source .xprofile
/opt/deepinwine/apps/Deepin-QQ/run.sh

while :
  do
    sleep 3
    ps aux | grep -i qq >/dev/null 2>&1 && continue
    break
  done
