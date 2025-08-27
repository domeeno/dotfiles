#!/bin/bash
#
#   __|  |              |  
# \__ \   _|   _` |   _| _|
# ____/ \__| \__,_| _| \__|
#
# \ \      /             |
#  \ \ \  /  _` |  |  |   _ \   _` |   _|
#   \_/\_/ \__,_| \_, | _.__/ \__,_| _|  
#                 ___/ 
#                 by Dominc Flocea (2025)
#

killall waybar

waybar -c ~/.config/waybar/config.jsonc -s ~/.config/waybar/style.css &
