#!/bin/bash

if [ "$2" = "*"  ]; then

    resulat=$(("$1" * "$3"))

else

        resultat=$(expr $1 "$2" $3)

fi

echo $resultat
