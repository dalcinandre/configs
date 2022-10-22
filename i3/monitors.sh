#!/usr/bin/env bash
#

VGA=VGA1
NOTE=LVDS1
HDMI=HDMI1

xrandr --auto \
  --output ${NOTE}  --mode 1366x768     --rotate normal --primary           \
  --output ${VGA}   --mode 1920x1080    --rotate normal --right-of ${NOTE}  \
  --output ${HDMI}  --mode 1920x1080    --rotate right  --right-of ${VGA}
