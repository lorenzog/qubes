#!/bin/sh
# zenity --list --modal --width=200 --height=390 --text "Select destination AppVM):" --radiolist --column "Pick" --column "AppVM" $(qvm-ls --running  --raw-data | cut -d '|' -f 1)
WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | tr -d ',')
echo "Window ID: $WINDOW_ID"
TARGET_VM=$(xprop -id $WINDOW_ID _QUBES_VMNAME | cut -d ' ' -f 3 | tr -d '"' )
xfce4-screenshooter -c -r
xclip -out -sel c -t image/png | qvm-run --pass-io $TARGET_VM 'xclip -sel c -t image/png'
