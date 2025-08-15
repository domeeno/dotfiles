#! /bin/bash

# function that goes to a directory and opens nvim there
export function nvimcd() {
  if [ -d "$1" ]; then
    cd "$1" && nvim .
  else
    echo "Directory $1 does not exist."
  fi
}

alias work=nvimcd
