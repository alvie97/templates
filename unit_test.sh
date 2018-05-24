#!/bin/bash

for file in dummy*; do
	if [ -a $file ]; then
		rm $file 
	fi
done
ls
echo "Starting test"
./test.exp
cat dummy.js

