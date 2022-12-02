#!/bin/sh
WINDOW_ID=$(xprop -root _NET_ACTIVE_WINDOW | cut -d ' ' -f 5 | sed 's/,//')
echo "Window ID: $WINDOW_ID"
PROP_NAME=$(xprop -id $WINDOW_ID _QUBES_VMNAME | cut -d ' ' -f 3 | sed 's/"//g')
echo "$PROP_NAME" | grep "not found" && exit 0
# VM_NMAME=$(echo "$PROP_NAME" | cut -d ' ' -f 3 | sed 's/"//g')
# echo $VM_NAME
qvm-run "$PROP_NAME" urxvt
# qvm-run "$PROP_NAME" x-terminal-emulator
