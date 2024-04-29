#!/bin/bash

d="$(date "+%F_%T")"

mkdir ~/test && echo "catalog test was created successfully" >> ~/report && touch ~/test/"$d"

ping -c 1 www.net_nikogo.ru 2>> ~/report
