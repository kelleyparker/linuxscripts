#!/bin/bash
clear
free -h
echo ''
sudo pvs
echo ''
sudo vgs
echo ''
sudo lvs    
echo ''

echo '!!! IF YOU GET PERMISSION DENIED, RUN SCRIPT AGAIN AS SUDO'
