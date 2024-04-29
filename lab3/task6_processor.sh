#!/bin/bash

num=1
mode="run"

usr1() {
    mode="+"
}
usr2() {
    mode="*"
}
terminate() {
    mode="terminate"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'terminate' SIGTERM

while true
do
    case $mode in
        "+")
            num=$((num + 2))
            echo "Result: $num"
            ;;
        "*")
            num=$((num * 2))
            echo "Result: $num"
            ;;
        "terminate")
            echo "Stopped by SIGTERM from another process"
            exit 0
            ;;
        "run")
            echo "Doing nothing..."
            ;;
        *)
            echo "Unknown mode"
            exit 1
            ;;
    esac 
    
    sleep 1
done