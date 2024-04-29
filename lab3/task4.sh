#!/bin/bash

# Название скрипта
script_name="task4_inf.sh"

# Находим PID процессов по их имени
pid1=$(pgrep -f $script_name | sed -n 1p)
pid2=$(pgrep -f $script_name | sed -n 2p)
pid3=$(pgrep -f $script_name | sed -n 3p)

if [[ -z $pid1 || -z $pid2 || -z $pid3 ]]; then
    echo "Не удалось найти 3 процесса $script_name"
    exit 1
fi

# cpulimit -p "$pid1" --limit=10 &
nice -n 10 renice -n 10 -p "$pid1"

kill "$pid3"