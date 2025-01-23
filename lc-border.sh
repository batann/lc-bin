#!/bin/bash
# vim:fileencoding=utf-8:foldmethod=marker
#author:	fairdinkum batan
#mail:		12982@tutanota.com
------------------------------------------------------------------------------------------------

#{{{###  clear command and ansi coloring
clear
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
BBlue='\e[0;104m'
BBlack='\e[0;100m'
RRed='\e[0;100m'
GGreen='\e[0;100m'
YYellow='\e[0;100m'
BBlue='\e[0;100m'
PPurple='\e[0;100m'
CCyan='\e[0;100m'
WWhite='\e[0;100m'

#}}}
#{{{###
#!/bin/bash

clear
read -p "Command:   >>>   " abc
clear


$abc| awk '{
    # Store the incoming line in the buffer
    lines[NR % 5] = $0;

    # Only process when we have 5 lines
    if (NR >= 5) {
        # Calculate the max line length
        max_len = 0;
        for (i = 0; i < 5; i++) {
            if (length(lines[i]) > max_len) {
                max_len = length(lines[i]);
            }
        }

        # Create top and bottom borders
        top_border = "╔";
        for (i = 1; i <= max_len + 2; i++) top_border = top_border "═";
        top_border = top_border "╗";

        bottom_border = "╚";
        for (i = 1; i <= max_len + 2; i++) bottom_border = bottom_border "═";
        bottom_border = bottom_border "╝";

        # Use tput to move the cursor to row 10 and column 0 before printing
        system("tput cup 10 0");

        # Print the top border
        print top_border;

        # Print the 5 most recent lines, wrapped in the border
        for (i = 0; i < 5; i++) {
            printf("║ %-*s ║\n", max_len, lines[(NR - 5 + i) % 5]);
        }

        # Print the bottom border
        print bottom_border;

        # Sleep for 0.2 seconds to slow down the updates
        system("sleep 0.2");
    }
}'


#}}}




