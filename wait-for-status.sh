#!/bin/bash

TIMEOUT="${TIMEOUT:-600}"
STATUS="${STATUS:200}"
seconds=0

echo 'Waiting up to' $TIMEOUT 'seconds for HTTP $STATUS from' $URL 
until [ "$seconds" -gt "$TIMEOUT" ] || "$(curl -L -s -o /dev/null --max-time $TIMEOUT -I -w "%{http_code}" $URL)" == "$STATUS" ]; do
  printf '.'
  sleep 5
  seconds=$((seconds+5))
done

if [ "$seconds" -lt "$TIMEOUT" ]; then
  echo 'OK'
else
  echo "ERROR: Timed out wating for given HTTP Status from" $URL >&2
  exit 1
fi
