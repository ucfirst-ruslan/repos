#!/bin/bash

PATH_FILE=$1

WHERE=$2

NAME_FILE=$(basename $PATH_FILE)

NAME="${NAME_FILE%.*}"

tar -czf $WHERE/$NAME.tar.gz $PATH_FILE

echo "Create archive is done!"
