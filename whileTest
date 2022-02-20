#!/bin/bash

while ps aux | grep $1 | grep -v grep > ~/output.txt
do
	sleep 5
done

clear
echo Your process has stopped
logger $1 is no longer present
