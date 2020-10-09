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

KUBECTL=$(which kubectl)
if [ -f /usr/local/bin/kubectl ]; then
  source <(kubectl completion bash)
  alias k='kubectl'
  complete -F __start_kubectl k
fi

alias ls='ls --color=auto'
[ -r ~/.dotfiles/myvars.sh ] && source ~/.dotfiles/myvars.sh

export GIT_PS1_SHOWDIRTYSTATE=1
GITP=$(__git_ps1 %s)
PS1="\[\033[01;32m\]\u\[\033[39m\]@\[\033[31m\]\h\[\033[39m\]:\[\033[01;34m\]\w\[\033[00m\]`[[ -n ${GITP} ]] && echo "(${GITP})"`\$ "

shopt -s cdspell
complete -d cd
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'TAB:menu-complete'
