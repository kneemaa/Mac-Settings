# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export GOPATH=/Users/nema/go
export AWS_PAGER=""
export AWS_SDK_LOAD_CONFIG=1

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="spaceship"
SPACESHIP_TIME_SHOW=true
SPACESHIP_BATTERY_THRESHOLD=20

export UPDATE_ZSH_DAYS=7

# python interpreter
plugins=python

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git terraform zsh-autosuggestions zsh-syntax-highlighting)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=white,bg=cyan,bold,underline"
source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="${GOPATH}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"


DEFAULT_USER=$USER


alias fucking="sudo"
alias tf="terraform"
alias tps="tf plan | scenery"
alias tfmt='tf fmt && git commit -am "tf fmt" && git push'
alias tfmtr='tf fmt --recursive && git commit -am "tf fmt" && git push'
alias tfp='tf plan -var-file="./vars/$(tf workspace show).tfvars" -lock=false'
alias reset-okta="rm -f ~/.aws/credentials ~/.okta/profiles ~/.okta/cookies.properties ~/.okta/.current-session"

## Git
alias get-default-branch='git symbolic-ref refs/remotes/origin/HEAD | sed "s@^refs/remotes/origin/@@g"'
alias checkout-default-branch='git checkout $(get-default-branch)'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/sbin:$PATH"
