#!/bin/bash

function stat_fun()
{
    stat $1
}


function tar_fun()
{
    NAME_FILE=$(basename $1)
    
    NAME="${NAME_FILE%.*}"

    tar -czf $NAME.tar.gz $1

    echo "Done!"
}


function cp_fun
{
    cp $1 /tmp/

    echo "Done!"
}

function mv_fun
{
    mv $1 $1.bak

    echo "Done!"
}


FILE=$1

case $2 in 
1 )
    stat_fun $FILE
;;
2 )
    tar_fun $FILE
;;
3 )
    cp_fun $FILE
;;
4 )
    mv_fun $FILE
;;
esac
