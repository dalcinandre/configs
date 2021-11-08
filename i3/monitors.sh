
#!/usr/bin/env bash
#

VGA=VGA-1
NOTE=LVDS-1
HDMI=HDMI-1

# xrandr --auto --output VGA-1 --left-of LVDS-1 --output HDMI-1 --right-of LVDS-1 --rotate right --mode 1920x1080
#xrandr --auto \
#  --output VGA-1 --right-of LVDS-1 --mode 1920x1080 \
#  --output HDMI-1 --right-of LVDS-1 --rotate right --mode 1920x1080

xrandr --auto \
  --output ${NOTE}  --mode 1366x768     --rotate normal                     \
  --output ${VGA}   --mode 1920x1080    --rotate normal --right-of ${NOTE}  \
  --output ${HDMI}  --mode 1920x1080    --rotate right  --right-of ${VGA}
