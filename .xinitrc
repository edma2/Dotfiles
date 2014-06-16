#!/bin/sh
external-monitor

xrdb ~/.Xresources

setxkbmap -option caps:escape
sxhkd &
volnoti

xset -b
xset +fp /usr/share/fonts/local
xset fp rehash

wmname LG3D

bat() {
  acpi -b | awk '{print $4}' | tr -d ','
}

while xsetroot -name "`netctl-auto current` `bat` `date`"; do
  sleep 1
done &
exec dwm
