#!/bin/bash

N=1900000
K=30

for (( i=0; i < K; i++ )); do
    ./newmem.bash "$N" &
    sleep 1
done
