find . -name "*.lua" -print | xargs sed -i 's/$1/$2/g'
for x in `find .`; do git mv $x ${x/$1/$2}; done
