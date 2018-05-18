#!/bin/bash

touch ~/linux/app2/result.txt

for FILE in ~/linux/app2/files/*
do

        #echo " $FILE"

        if [ -f "$FILE" ]
        then

                echo "[Start]" >> ~/linux/app2/result.txt

                cat $FILE >> ~/linux/app2/result.txt

                echo "[End]" >> ~/linux/app2/result.txt

        fi

done
