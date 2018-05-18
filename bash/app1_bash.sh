#!/bin/bash

# This first comment

#rsync -av -include='*/' --exclude='*' /appl/files/ /appl/

for x in $(find -name "*.crt")
do 

#echo $x

FILE_NAME=$(basename $x)
#echo $FILE_NAME
NAME="${FILE_NAME%.*}"
#echo $NAME

mkdir ~/linux/app1/$NAME

mv $x ~/linux/app1/$NAME/file.txt

done
