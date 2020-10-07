#
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

[ -d /usr/share/git/completion ] && CAMINHO="/usr/share/git/completion"
[ -d /usr/share/git-core/contrib/completion ] && CAMINHO="/usr/share/git-core/contrib/completion"
[ -r ${CAMINHO}/git-completion.bash ] && . ${CAMINHO}/git-completion.bash
. ${CAMINHO}/git-prompt.sh

[[ $DISPLAY ]] && shopt -s checkwinsize

alias ls='ls --color=auto'
[ -r ~/.dotfiles/myvars.sh ] && source ~/.dotfiles/myvars.sh

# PS1='[\u@\h \W]\$ '
export GIT_PS1_SHOWDIRTYSTATE=1
GITP="($(__git_ps1 %s))"
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]${GITP}\$ "

# set -o vi
shopt -s cdspell
complete -d cd

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
set show-all-if-ambiguous on
set completion-ignore-case on
# bind 'set completion-ignore-case on'
bind 'TAB:menu-complete'
