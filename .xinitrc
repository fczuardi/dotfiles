#!/bin/sh

# use right alt as the compose key
setxkbmap -option compose:ralt

if [ -x "$(command -v compton)" ]; then
  compton -CGb
fi

# use a env var $WM to start on different window managers (defaults to i3)
if [[ $WM = "gnome" ]]; then
  gnome-session
else
  # start ssh-agent, later on a terminal you can type ssh-add to enter your ssh-key password only once
  eval $(ssh-agent)
  # start i3wm
  i3
fi
