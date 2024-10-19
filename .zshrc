export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git wd)

source $ZSH/oh-my-zsh.sh

alias grbm="git fetch origin main && git rebase -i origin/main"
alias grb5="git rebase -i HEAD~5"
alias grb10="git rebase -i HEAD~10"
alias grb20="git rebase -i HEAD~20"
alias gc!="git commit -v --amend --no-edit"
alias gcom="git checkout main && git fetch origin main && git reset --hard origin/main"

function cd () {
    builtin cd "$@" && ls
}

function gcob() {
    git checkout $(git for-each-ref --sort=-authordate:iso8601 --format='%(color:green)%(authordate:iso8601)%09%(color:white)%(refname:short)' refs/heads/ | fzf --height=40% --ansi | awk '{print $4}')
}

alias vim='nvim'
alias vi='nvim'
export EDITOR='nvim'
export VISUAL='nvim'

source /opt/homebrew/Cellar/fzf/0.55.0/shell/key-bindings.zsh
source /opt/homebrew/Cellar/zsh-autosuggestions/0.7.0/share/zsh-autosuggestions/zsh-autosuggestions.zsh
