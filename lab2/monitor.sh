#!/bin/bash

process=$1
interval=$2
echo "Interval is $interval"

pid=$(pgrep "$process")
while true
do
	pid=$(pgrep -x "$process")
	if [[ -n "$pid" ]]
	then
		break
	fi
done

echo "Found process. Now waiting..."

sleep "$interval"

echo "Killing pid=$pid"
kill -9 $pid
echo "Killed!"


