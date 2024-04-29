#!/bin/bash

echo "Waiting for processor to start..."

PID=""
while true
do
    PID=$(pgrep -f task6_processor.sh)

    if [[ -n $PID ]]; then
        echo "Found processor with PID: $PID"
        break
    fi
    
    sleep 1
done 


while true
do
    read -r line

    case $line in
        "+")
            echo "Sending USR1 signal"
            kill -USR1 "$PID"
            ;;
        "*")
            echo "Sending USR2 signal"
            kill -USR2 "$PID"
            ;;
        TERM)
            echo "Sending SIGTERM signal"
            kill -SIGTERM "$PID"
            exit 0
            ;;
        *)
            :
            ;;
    esac
done