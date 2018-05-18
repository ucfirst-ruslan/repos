#!/bin/bash

#######
#----- Файл со списком сайтов положить в туже папку, где и скрипт.
#----- Файл должен иметь название 'list_site'
########

ROOT_DIR="webfolder"

SLINK="/services/php/bin/php-cgi"

while read LINE
do
    CHAR1=${LINE:0:1}
    mkdir $ROOT_DIR/$CHAR1

    CHAR2=${LINE:1:1}
    mkdir $ROOT_DIR/$CHAR1/$CHAR2

    mkdir $ROOT_DIR/$CHAR1/$CHAR2/$LINE


    mkdir $ROOT_DIR/$CHAR1/$CHAR2/$LINE/public
    mkdir $ROOT_DIR/$CHAR1/$CHAR2/$LINE/private
    mkdir $ROOT_DIR/$CHAR1/$CHAR2/$LINE/cgi-bin
    mkdir $ROOT_DIR/$CHAR1/$CHAR2/$LINE/logs

    echo "$LINE Folder structure created."


    # Создаю файлы .store и online
    # Если генератор псевдорандомных значений не "0" - создание файла/линка
    RAND1=$(( $RANDOM % 3 ))

    if [ ! "$RAND1" = '0' ]
        then
        touch $ROOT_DIR/$CHAR1/$CHAR2/$LINE/public/.store

        echo "Created file .store"
    fi


    RAND2=$(( $RANDOM % 3 ))

    if [ ! "$RAND2" = '0' ] && [ ! "$RAND1" = '0' ]
        then

        RAND3=$(( $RANDOM % 3 ))

        if [ ! "$RAND3" = '0' ]
        then
            ln -s $SLINK $ROOT_DIR/$CHAR1/$CHAR2/$LINE/cgi-bin/online

            echo "Created valid symlink online"
        else
            ln -s /services/php/bin/ph
$ROOT_DIR/$CHAR1/$CHAR2/$LINE/cgi-bin/online

            echo "Created broken symlink online"
        fi
    fi

    echo "----"

done < list_site
