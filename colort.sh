#!/bin/bash
# Run like this: cat file.txt | ./color.sh WORD1 WORD2 WORD3 ...
# Each WORD receives a different color in the log

NC='\\e[0m' # No Color

while read line
do
    sedcmd=""
    idx=31 # RED
    for i; do
	color='\\e['$idx'm'
	sedcmd+="-e s/$i/$color$i$NC/g "
	(( idx++ ))
    done
    echo -e `echo $line | sed $sedcmd`
done <&0 #read from stdin
