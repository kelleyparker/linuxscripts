#!/bin/bash

#Checking for nvme0n1 and the first 3 partitions on this host

LookupNvme0n1=`sudo fdisk -l /dev/nvme0n1 2> /dev/null`
LookupNvme0n1p1=`sudo fdisk -l /dev/nvme0n1p1 2> /dev/null`
LookupNvme0n1p2=`sudo fdisk -l /dev/nvme0n1p2 2> /dev/null`
LookupNvme0n1p3=`sudo fdisk -l /dev/nvme0n1p3 2> /dev/null`

if [ "$LookupNvme0n1" ]; then
        echo "Successful - /dev/nvme0n1 exists on this machine"
else
        echo "Failure"
fi


if [ "$LookupNvme0n1p1" ]; then
        echo "Successful - /dev/nvme0n1p1 exists on this machine"
else
        echo "Failure"
fi

if [ "$LookupNvme0n1p2" ]; then
        echo "Successful - /dev/nvme0n1p2 exists on this machine"
else
        echo "Failure"
fi


if [ "$LookupNvme0n1p3" ]; then
        echo "Successful - /dev/nvme0n1p3 exists on this machine"
else
        echo "Failure"
fi

