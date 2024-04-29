#!/bin/bash

report_file="report.log"
echo -n > "$report_file"

steps=0
array=()

while true; do
    ((steps++))
    array+=(1 2 3 4 5 6 7 8 9 10)
    
    if ((steps % 100000 == 0)); then
        echo ${#array[@]} >> "$report_file"
    fi
done
