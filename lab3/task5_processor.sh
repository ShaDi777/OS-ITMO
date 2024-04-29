#!/bin/bash
mode="+"
num=1

(tail -f task5_pipe) |
while true
do
    read -r line
    case "$line" in
        "+")
            mode="+"
            echo "Now adding!"
            ;;
        "*")
            mode="*"
            echo "Now multiplying!"
            ;;
        [0-9]*)
            case $mode in
                "+")
                    echo "Adding $num and $line" 						
                    num=$((num + line))
                    echo "And the result is: $num" 
                    ;;
                "*")
                    echo "Multiplying $num and $line" 						
                    num=$((num * line))
                    echo "And the result is: $num" 
                    ;;
            esac
            ;;
        QUIT)
            echo "Stopped by the QUIT input"
            echo "RESULT: $num"
            killall tail
            exit 0
            ;;
        *)
            echo "Stopped by the INCORRECT input"
			killall tail
            exit 1
            ;;
    esac
done