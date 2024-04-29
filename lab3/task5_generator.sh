#!/bin/bash

while true
do
    read -r line
    echo "$line" > task5_pipe

    if [[ "$line" == "QUIT" ]]
	then
        echo "Finishing..."
		exit 0
	fi

	if [[ ! "$line" =~ [0-9]+ && "$line" != "+" && "$line" != "*" ]] 
	then 
		echo "Incorrect input"
		exit 1
	fi
done
