#!/usr/bin/env bash
set -euo pipefail

options=(
" Lock"
" Sleep"
" Reboot"
" Power Off"
"󰿅 Logout"
)


choice=$(printf '%s\n' "${options[@]}" | wofi --show dmenu --prompt "Power" --width 260 --height 220)


case "$choice" in
*Lock*)
if command -v hyprlock >/dev/null 2>&1; then hyprlock;
elif command -v swaylock >/dev/null 2>&1; then swaylock -f;
else loginctl lock-session; fi ;;
*Sleep*) systemctl suspend ;;
*Reboot*) systemctl reboot ;;
*Power\ Off*) systemctl poweroff ;;
*Logout*) hyprctl dispatch exit ;;
*) exit 0 ;;
esac




# ~/.config/waybar/scripts/bluetooth.sh
#!/usr/bin/env bash
set -euo pipefail


power=$(bluetoothctl show | awk -F': ' '/Powered/ {print $2}')
if [[ "$power" != "yes" ]]; then
echo "󰂲 off" # bluetooth off
exit 0
fi


conn_line=$(bluetoothctl devices Connected | head -n1)
if [[ -z "$conn_line" ]]; then
echo "󰂯 on" # on but not connected
exit 0
fi
mac=$(awk '{print $2}' <<<"$conn_line")
name=$(bluetoothctl info "$mac" | awk -F': ' '/Name/ {print $2; exit}')
[[ -z "$name" ]] && name="device"
echo "󰂱 $name"
