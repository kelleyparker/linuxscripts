#!/bin/bash

echo "Here is a list of all volume groups on your machine:"
fdiskOutput=sudo fdisk -l | grep vg_ | awk '{print $2}' | cut -d: -f1
echo $fdiskOutput

echo '!!! IF YOU SEE PERMISSION DENIED, RUN COMMAND AGAIN WITH SUDO !!!'
