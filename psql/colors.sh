#!/usr/bin/env bash
#

GRE=$(echo -e '\e[0;32m')
NOR=$(echo -e '\e[0m')
PAGER="sed \"s/^\((\w\+ [rows]\+)\)/$GRE\1$NOR/;           \
    s/^\(-\[\ RECORD\ \w\+\\][-+]\+\)/$GRE\1$NOR/;                \
    s/|/$GRE|$NOR/g;                                              \
    s/^\([-+]\+\)/$GRE\1$NOR/\" 2> /dev/null | less -iMSx4 -FXR"
