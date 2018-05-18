#!/bin/bash

ROOT_DIR="webpages" #root directory for webpages
SLINK="/services/php/bin/php-cgi" #Location /services/php/bin/php-cgi

for a in $(ls $ROOT_DIR/)
do
    #echo $a
    for b in $(ls $ROOT_DIR/$a)
    do
        #echo $b
        for SITE in $(ls $ROOT_DIR/$a/$b)
        do
            echo "Проверяю $SITE"
            if [ -f "$ROOT_DIR/$a/$b/$SITE/public/.store" ]
            then

                echo "Проверяю наличие симлинка."

                GET_LINK_PATH=$(awk '{print $11}' <(ls -l $ROOT_DIR/$a/$b/$SITE/cgi-bin/online 2> /dev/null))

                if [ ! "$GET_LINK_PATH" = "$SLINK" ]
                then
                    ln -s $SLINK $ROOT_DIR/$a/$b/$SITE/cgi-bin/online

                    echo "Создан новый линк."
                fi

            else
                echo "Создание линка не требуется."
            fi
        done
    done
done
