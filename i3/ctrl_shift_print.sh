
#!/usr/bin/env bash
#

scrot '%Y-%m-%d_$wx$h_scrot.png' \
  -s --line='style=dash,width=1,color=yellow' \
  -f -e 'mv $f /tmp && xclip -selection clipboard -t "image/png\" -i /tmp/$f'
