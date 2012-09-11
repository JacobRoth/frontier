#!/bin/bash

PATTERN=$1
REPLACEMENT=$2

IFS=$'\t'

while read DIR FILE; do
        if ["$DIR/$FILE" == "$DIR/${FILE//$PATTERN/$REPLACEMENT}"]; then
                echo "no filename change needed"
        else
                git mv "$DIR/$FILE" "$DIR/${FILE//$PATTERN/$REPLACEMENT}"
        fi
done < <(exec find \( ! -regex '.*/\..*' \) -type f -printf "%h\t%f\n")


find . -name "*.lua" -print | xargs sed -i 's/$1/$2/g'
