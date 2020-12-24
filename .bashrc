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

if [ -f /usr/local/bin/kubectl ]; then
  source <(kubectl completion bash)
  alias k='kubectl'
  complete -F __start_kubectl k
fi

alias ls='ls --color=auto'
alias ip='ip -c'

[ -r ~/.dotfiles/myvars.sh ] && source ~/.dotfiles/myvars.sh

# get current branch in git repo
function parse_git_branch() {
  BRANCH=$(sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/' <<< $(git branch 2> /dev/null))
  [[ ${BRANCH} ]] && echo -e " \e[33m[$(__git_ps1 %s)]\e[0m " || echo
}

export GIT_PS1_SHOWDIRTYSTATE=1
COLOR_USER="\e[32m"
COLOR_HOST="\e[31m"
COLOR_DIR="\e[34m"
COLOR_NORMAL="\e[0m"

PS1="${COLOR_USER}\u${COLOR_NORMAL}@${COLOR_HOST}\h${COLOR_NORMAL}:${COLOR_DIR}\w${COLOR_NORMAL}\`parse_git_branch\`\$ "

shopt -s cdspell
complete -d cd
bind 'set completion-ignore-case on'
bind 'set show-all-if-ambiguous on'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind 'TAB:menu-complete'
