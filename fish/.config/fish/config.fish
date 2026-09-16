set fish_greeting ""

# ---- PATH / ENV ----

#bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pipx
set PATH $PATH $HOME/.local/bin

# ---- TOOL INIT ----

# pyenv
if test -d ~/.pyenv
    set -x PATH ~/.pyenv/bin $PATH
    status --is-interactive; and . (pyenv init -|psub)
end
if functions -q pyenv-virtualenv-init
    status --is-interactive; and pyenv virtualenv-init -
end

# ---- LSD ----

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias ll='ls -lh'
alias lla='ls -lha'
alias lt='ls --tree'

# ---- DOCKER ----

alias dc='docker compose'
alias dps='docker ps'
alias dpa='docker ps -a'
alias dl='lazydocker'
alias cls='colima start'
alias clx='colima stop'

# ---- iCloud ----

set -g mobile_documents "$HOME/Library/Mobile Documents"
alias cdi='cd "$mobile_documents/com~apple~CloudDocs"'
alias cdo='cd "$mobile_documents/iCloud~md~obsidian/Documents"'

# ---- BREW ----

alias brewup='brew update && brew upgrade'
alias brewin='brew install'
alias brewinc='brew install --cask'

# ---- DOCK ----

alias add-dock-space="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="spacer-tile";}'; killall Dock"
alias add-dock-small-space="defaults write com.apple.dock persistent-apps -array-add '{"tile-type"="small-spacer-tile";}'; killall Dock"
