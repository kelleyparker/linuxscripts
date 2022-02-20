#!/bin/bash

pingCommand=`ping -c 1 $1 2> /dev/null`

if [ "$pingCommand" ]; then
        echo "Successful"
else
        echo "Failure"
fi
