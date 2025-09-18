#!/bin/bash

play_feedback() {
  paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga &
}

case "$1" in
  up)
    pamixer --unmute
    pamixer -i 5
    ;;
  down)
    pamixer --unmute
    pamixer -d 5
    ;;
  mute)
    pamixer -t
    ;;
esac

play_feedback

pkill -RTMIN+8 waybar
