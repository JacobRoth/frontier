#!/bin/bash

find . -name "*.lua" -print | xargs sed -i 's/$1/$2/g' #replaces text in-file
for infile in `find . \( ! -regex '.*/\..*' \)`
do 
	newname=`echo $infile | sed "s/$1/$2/"`
	git mv $infile $newname
done
