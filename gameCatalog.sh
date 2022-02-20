#!/bin/bash

snesNotification() {
        local message="This game is for the SNES"
        echo $message
}

display="$(snesNotification)"
echo $(snesNotification)
