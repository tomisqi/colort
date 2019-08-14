#!/bin/bash
# Run like this:

RED='\033[0;31m'
NC='\033[0m' # No Color

sedcmd=""
for i; do
    sedcmd+="-e s/$i/$RED""$i""$NC/ "
done
printf "sedcmd=%s\n" "$sedcmd"

cat /dev/stdin | sed ''$sedcmd''

#printf "I ${RED}love${NC} Stack Overflow\n"

