#!/bin/bash
clear
abc=$(ls /home/batan/dot/cheat/|smenu -c -m "Select a cheatsheet to display:" -n5 )
st less /home/batan/dot/cheat/$abc 
