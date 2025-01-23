#!/bin/bash

# Clear the screen and prompt the user for input and output file names
clear
echo -e '\033[31m================================================\033[0m'
read -p 'file to clean   >>>   ' input_file
read -p 'name new file   >>>   ' output_file

# Read the content of the file
content=$(cat "$input_file")

# Remove everything between the delimiters
cleaned_content=$(echo "$content" | sed -E "s/\[[^]]*\]//g; s/\([^)]*\)//g; s/\{[^}]*\}//g; s/<[^>]*>//g; s/\"[^\"]*\"//g; s/'[^']*'//g")

# Remove everything but [a-z], [A-Z], [0-9], ., ,, :, ;, spaces, and newlines
cleaned_content=$(echo "$cleaned_content" | tr -cd '[:alnum:].,:; \n')

# Write the cleaned content to the output file
echo "$cleaned_content" > "$output_file"

