#!/bin/bash

log_file="top_info.log"
echo -n > "$log_file"

while true; do
	{
        top_output=$(top -b -n 1)
        top_summary=$(echo "$top_output" | head -n 5)
        mem_bash_info=$(echo "$top_output" | grep "mem[2]*.bash")

        if [[ -n "$mem_bash_info" ]]; then
            echo "$top_summary"
            echo "$mem_bash_info"
            echo
        fi
    } >> $log_file
	
done