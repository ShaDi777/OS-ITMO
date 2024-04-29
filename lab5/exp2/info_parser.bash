#!/bin/bash

log_file="top_info.log"

cat $log_file | grep "top " | awk '{print $3}' > time_info.log
cat $log_file | grep "MiB Mem" | awk '{print $4, $6, $8}' > mem_info.log
cat $log_file | grep "MiB Swap" | awk '{print $3, $5, $7}' > swap_info.log
