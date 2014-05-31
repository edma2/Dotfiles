#!/bin/sh
external-monitor

xrdb ~/.Xresources

setxkbmap -option caps:escape
sxhkd &
volnoti

xset -b
xset +fp /usr/share/fonts/local
xset fp rehash

feh --bg-fill ~/pics/asoiaf.jpg

wmname LG3D

bat() {
  acpi -b | awk '{print $4}' | tr -d ','
}

while xsetroot -name "`date` `bat` `uptime | sed 's/.*,//'`"; do
  sleep 1
done &
exec dwm
