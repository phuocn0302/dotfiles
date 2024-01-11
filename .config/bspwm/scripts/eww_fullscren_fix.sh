#!/bin/bash

bspc subscribe node_state | while read -r _ _ _ _ state flag; do
  if [[ "$state" != fullscreen ]]; then continue; fi
  if [[ "$flag" == on ]]; then
    xdotool search --class eww-bar windowunmap
  else
    xdotool search --class eww-bar windowmap
  fi
done &
