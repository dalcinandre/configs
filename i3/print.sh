
#!/usr/bin/env bash
#

scrot '%Y-%m-%d_$wx$h_scrot.png' \
  -e 'mv $f /tmp && xclip -selection clipboard -t "image/png" -i /tmp/$f && feh /tmp/$f'
