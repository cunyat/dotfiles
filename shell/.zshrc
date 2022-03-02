export ZSH="${HOME}/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    ubuntu
    docker-compose
    docker
)

source $ZSH/oh-my-zsh.sh

alias zshconfig="nvim ~/.zshrc"
alias ohmyzsh="nvim ~/.oh-my-zsh"
alias cl="clear"
alias vi="nvim"
gcof() {
    git checkout "$(git branch | fzf | tr -d '[:space:]')"
}

export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export DOTFILES_APPS_INSTALL_PATH="${HOME}/.local/apps"

#------------- Go(lang) -------------#
export GOROOT="${DOTFILES_APPS_INSTALL_PATH}/go"
export GOCACHE="${DOTFILES_APPS_INSTALL_PATH}/cache/go"
export GOENV="${DOTFILES_APPS_INSTALL_PATH}/config/go/env"
export GOPATH="${HOME}/go"

export PATH="$PATH:$GOROOT/bin:$GOPATH/bin:$HOME/.local/bin:$HOME/.symfony/bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


yarn --version 2> /dev/null > /dev/null && export PATH="$(yarn global bin):$PATH"

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh ] && source "${XDG_CONFIG_HOME:-$HOME/.config}"/fzf/fzf.zsh

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export EDITOR=nvim