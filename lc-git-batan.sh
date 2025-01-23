#!/bin/bash

while :;
do
	clear
	read -p "git repo:   >>>   " abc
	input="$input $abc"
	if [[ -z "$abc" ]];
	then
		break
		fi
	done

	do
		git clone https://github.com/batann/$i.git
		sudo -u batan bash $i/install.sh
	done
