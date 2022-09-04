#!/usr/bin/env bash

touch /var/log/nginx/error.log

if [ "$#" -gt 0 ]; then
  "$@"
  exit 0
fi

for f in /usr/local/bin/launch_*.sh; do
  bash "$f"
done



echo "----------------------------------------------------------------------"
echo "Website is running!"
echo "----------------------------------------------------------------------"