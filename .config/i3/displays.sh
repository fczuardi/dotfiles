#!/bin/bash

# copied from https://www.reddit.com/r/i3wm/comments/4sabn9/just_got_a_second_screen_how_to_deal_with_it/d5eyahd

PRIMARY="eDP1"
SECONDARY="HDMI1"

if  xrandr | grep -q "$SECONDARY d"; then
	xrandr --output "$SECONDARY" --off
  notify-send "$SECONDARY off"
else
	xrandr --output "$SECONDARY" --auto
	xrandr --output "$SECONDARY" --above "$PRIMARY"
  notify-send "$SECONDARY above $PRIMARY"
fi
