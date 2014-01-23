#!/bin/bash
xrandr --output DP3 --off --output DP1 --off --output DP2 --off --output HDMI3 --off --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --output eDP1 --off
xrandr --output DP3 --off --output eDP1 --mode 1366x768 --pos 1920x0 --output DP1 --off --output DP2 --off --output HDMI1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI2 --off --output HDMI1 --off --output VGA1 --off --rotate normal

killall stalonetray
# Line by line, the options used by default below mean:
# - icons should be aligned with the "East" or right side of the tray
# - the width of the tray should be 5 icons wide by one icon tall, and it
#   should be located 0 pixels from the right of the screen (-0) and 0 pixels
#   from the top of the screen (+0).
# - By setting our maximum geometry to the same thing, the tray will not grow.
# - The background color of the tray should be black.
# - This program should not show up in any taskbar.
# - Icons should be set to size "24".
# - Kludges argument of "force_icons_size" forces all icons to really, truly
#   be the size we set.
# - window-strut "none" means windows are allowed to cover the tray. In
#   other words, trust xmonad to handle this part.
#
stalonetray \
  --icon-gravity E \
  --geometry 7x1-0+0 \
  --max-geometry 7x1-0+0 \
  --background '#000000' \
  --skip-taskbar \
  --icon-size 24 \
  --kludges force_icons_size \
  --window-strut none \
  &

nitrogen --restore &

~/.capsIsEscape &
