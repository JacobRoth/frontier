
#!/bin/bash
#find . -name "*.lua" | perl -pi.bak -e "s/$1/$2/"
for file in `find . -name "*.lua"`
do
	echo sed -i "s/$1/$2/g" $file
done

for infile in `find . \( ! -regex '.*/\..*' \)`
do 
	newname=`echo $infile | sed "s/$1/$2/"`
	if [ "$infile" != "$newname" ]
	then 
		echo git mv $infile $newname
	fi
done
