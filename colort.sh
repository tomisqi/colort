#!/bin/bash
# Run like this: cat file.txt | ./color.sh WORD1 WORD2 WORD3 ...
# Each WORD receives a different color in the log

# TODO
# [ ] Using echo -e removes tabs
# [ ] Option to have more than one string per color
# [ ] Handle no arguments passed
# [ ] Faster?

NC='\\e[0m' # No Color

# Build sed command
sedcmd=""
idx=31 # RED
for i; do
    color='\\e['$idx'm'
    sedcmd+="-e s/$i/$color$i$NC/g "
    (( idx++ ))
done

# Replace each line in file
while read line
do
    echo -e `echo $line | sed $sedcmd`
done <&0 #read from stdin
