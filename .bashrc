#
# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[[ $DISPLAY ]] && shopt -s checkwinsize

alias ls='ls --color=auto'
[[ -r ~/.dotfiles/myvars.sh ]] && source ~/.dotfiles/myvars.sh
# PS1='[\u@\h \W]\$ '
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# set -o vi
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd
