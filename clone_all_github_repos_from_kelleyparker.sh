#!/bin/bash

# I got this script from https://stackoverflow.com/questions/19576742/how-to-clone-all-repos-at-once-from-github.  This allows me to clone all repositories from my Github to a single folder on Bash

GHUSER=kelleyparker; curl "https://api.github.com/users/$GHUSER/repos?per_page=1000" | grep -o 'git@[^"]*' | xargs -L1 git clone
