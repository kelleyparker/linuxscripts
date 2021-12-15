#!/usr/bin/env bash


echo "Here is the list of the first 3 Super Mario Bros. games, one entry per line:"

marioGame="Super Mario Bros."

for ((i = 1 ; i < 4 ; i++)); do
        echo $marioGame $i
done

