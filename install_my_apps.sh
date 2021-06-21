#!/bin/bash

set -eu -o pipefail # fail on error , debug all lines

sudo -n true
test $? -eq 0 || exit 1 "you should have sudo priveledge to run this script"

LIST_OF_APPS=""

apt-get update
echo "Installing some applications I like"
while read -r p; do sudo apt-get install -y $p ; done < <(cat << EOF
      openjdk-11-jdk
      ruby-full
      python-is-python3
      neofetch
      npm
      curl
      wget
      git-all
      emacs
      atom
      ghc
EOF
)
echo press Ctrl+c to quit
sleep 5
