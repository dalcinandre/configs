autoload -Uz compinit
compinit

export ZSH="/home/operador/.oh-my-zsh"

ZSH_THEME="random"

ZSH_THEME_RANDOM_CANDIDATES=(
    "maran"
    "sorin"
    "jaischeema"
    "nicoulaj"
    "nanotech"
    "lambda"
    "arrow"
    "miloshadzic"
    "norm"
)

ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
    yarn
    npm
    zsh-syntax-highlighting
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

source ~/projects/configs/myvars.sh
source <(kubectl completion zsh)
