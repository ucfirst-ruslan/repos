#!/bin/bash

MEM=$(awk '/^Mem/ {print $3}' <(free -m))

echo $MEM


if [ "$MEM" = "$1" ]
then

       	echo "You win!"
else

       	echo "You lose :("

fi
