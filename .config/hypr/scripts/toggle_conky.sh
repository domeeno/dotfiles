#!/bin/bash

if pgrep -x "conky" > /dev/null; then
    pkill conky
else
    conky -c ~/.config/conky/conky.conf &
fi
