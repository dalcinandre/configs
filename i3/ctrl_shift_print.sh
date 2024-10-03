
#!/usr/bin/env bash
#

scrot -f -s --line='style=dash,width=1,color=yellow' - | xclip -sel clip -t 'image/png'
# scrot '%Y-%m-%d_$wx$h_scrot.png' -f -s --line='style=dash,width=1,color=yellow' - | xclip -in -sel clip -t 'image/png'
  # -f -e 'mv $f /tmp && xclip -loops 0 -in -sel clip -t "image/png\" -i /tmp/$f'
  # -f -e 'mv $f /tmp && xclip -in -sel clip -t "image/png\" < /tmp/$f'
  # -f -e 'mv $f /tmp && xclip -selection clipboard -t "image/png\" -i /tmp/$f; exit 0'
