
#!/usr/bin/env bash
#

scrot '%Y-%m-%d_$wx$h_scrot.png' \
  -f -e 'mv $f /tmp && feh /tmp/$f' \
  -s --line='style=dash,width=1,color=yellow'
