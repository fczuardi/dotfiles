#!/bin/bash
CLASSES=$(i3-msg -t get_tree | jq -r '[recurse(.nodes[]) | .window_properties | objects | .class | ascii_downcase] | unique | .[]')
echo "$CLASSES"
for name in $CLASSES; do
  echo "kill $name"
  pkill "$name"
done
pkill vlc
pkill redshift
