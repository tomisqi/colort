#!/bin/bash
# Run like this: cat file.txt | ./color.sh WORD1 WORD2 WORD3 ...
# Each WORD receives a different color in the log

# TODO
# [ ] Option to have more than one string per color
# [ ] Tabs are removed

NC='\\e[0m' # No Color

# Build sed command
sedcmd=""
idx=31 # RED
for i; do
    color='\\e['$idx'm'
    sedcmd+="-e s/$i/$color$i$NC/g "
    (( idx++ ))
done

# If no arguments, cat the stdin and exit
if [[ "$sedcmd" == "" ]]; then
    cat <&0
    exit 0
fi

# Replace each line in file
while IFS= read -r line; do
    printf "%b\n" `echo "$line" | sed $sedcmd`
done <&0 #read from stdin
