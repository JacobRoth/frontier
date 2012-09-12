
#!/bin/bash

#find . -name "*.lua" | xargs sed -i 's/$1/$2/g' #replaces text in-file

for infile in `find . -name "*.lua"`
do
	sed -i 's/$1/$2/g' infile
done

for infile in `find . \( ! -regex '.*/\..*' \)`
do 
	newname=`echo $infile | sed "s/$1/$2/"`
	if [ "$infile" != "$newname" ]
	then 
		git mv $infile $newname
	fi
done
