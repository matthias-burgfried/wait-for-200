#!/bin/bash

TIMEOUT="${TIMEOUT:-60}"
STATUS="${STATUS:-200}"
seconds=0

echo 'Waiting up to' $TIMEOUT 'seconds for HTTP' $STATUS 'from' $URL
until [ "$(curl -L -s -o /dev/null --max-time $TIMEOUT -I -w '%{http_code}' $URL)" -eq "$STATUS" ]; do
  printf $seconds's'
  sleep 5
  seconds=$((seconds+5))
  if [ "$seconds" -gt "$TIMEOUT" ]; then
    printf "\nERROR: Timed out wating for given HTTP Status from "$URL"\n"
    exit 1
  fi
  printf '...'
done

echo "ok"
exit 0
