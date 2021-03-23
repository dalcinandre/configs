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
[[ ${CAMINHO} ]] && . ${CAMINHO}/git-prompt.sh

[[ $DISPLAY ]] && shopt -s checkwinsize

if [ -f /usr/local/bin/kubectl ]; then
  source <(kubectl completion bash)
  alias k='kubectl'
  complete -F __start_kubectl k
fi

alias ls='ls --color=auto'
alias ip='ip -c'

[ -r ~/.dotfiles/myvars.sh ] && source ~/.dotfiles/myvars.sh

COR_USER="\[\e[33m\]"
COR_HOST="\[\e[32m\]"
COR_DIR="\[\e[34m\]"
COR_GIT="\[\e[31m\]"
COR_NORMAL="\[\e[00m\]"

# get current branch in git repo
function parse_git_branch() {
  BRANCH=$(sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' <<< $(git branch 2> /dev/null))
  [[ ${BRANCH} ]] && echo "[$(__git_ps1 %s)]" || echo
}

export GIT_PS1_SHOWDIRTYSTATE=1

PS1="${COR_USER}\u${COR_NORMAL}@${COR_HOST}\h${COR_NORMAL}:${COR_DIR}\w${COR_GIT}\`parse_git_branch\`${COR_NORMAL}\\$ "

export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL="$HISTCONTROL erasedups:ignoreboth"

# set -o vi

shopt -s cdspell
complete -d cd
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'TAB:menu-complete'
