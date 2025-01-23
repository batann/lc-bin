#!/bin/bash

BASE_DIR="/home/batan/.config/lc-bin"

# check location

if [[ ! -d "/home/batan/.config/lc-bin" ]] ;
then
	echo -e "\033[34mBin files are not in \033[31m${BASE_DIR}\033[0m"
	mkdir $BASE_DIR
	sudo mv lc-* $BASE_DIR
	sudo mv lc-* $BASE_DIR
	sudo mv lc-* //usr/bin/
	sudo chmod a+x $BASE_DIR/lc-*
	sudo chmod a+x /usr/bin/lc-*
else
  	for i in $(ls);
	do
		sudo mv $BASE_DIR/${i} $BASE_DIR/${i}.old
		cp $i $BASE_DIR/${i}
		sudo cp $i /usr/bin/
	done
	sudo chmod a+x $BASE_DIR/lc-*
	sudo chmod a+x /usr/bin/lc-*
fi

