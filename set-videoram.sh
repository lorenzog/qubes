#!/bin/sh
# vm-features dom0 gui-videoram-min 48600
qvm-features dom0 gui-videoram-min $(xrandr --verbose | grep "Screen 0" | sed -e 's/.*current //' -e 's/\,.*//' | awk ' { print $1*$3*4/1024}')
qvm-features dom0 gui-videoram-overhead 0

