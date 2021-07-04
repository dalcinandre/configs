#!/usr/bin/env bash
#

export GRE=`echo -e '\e[0;32m'`
export NOR=`echo -e '\e[0m'`
export PAGER="sed \"s/^\((\w\+ [rows]\+)\)/$GRE\1$NOR/;           \
    s/^\(-\[\ RECORD\ \w\+\\][-+]\+\)/$GRE\1$NOR/;                \
    s/|/$GRE|$NOR/g;                                              \
    s/^\([-+]\+\)/$GRE\1$NOR/\" 2> /dev/null | less -iMSx4 -FXR"
