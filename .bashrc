#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# case ${TERM} in
#
#   xterm*|rxvt*|Eterm|aterm|kterm|gnome*|alacritty)
#     PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#
#     ;;
#   screen*)
#     PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
#     ;;
# esac

alias ls='ls --color=auto'
# PS1='[\u@\h \W]\$ '
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

set -o vi
bind 'set completion-ignore-case on'
shopt -s cdspell
complete -d cd
