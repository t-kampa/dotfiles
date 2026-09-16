#!/usr/bin/env bash
set -euo pipefail

# Install Homebrew if missing
command -v brew >/dev/null 2>&1 || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install GNU Stow (symlink manager) if missing
command -v stow >/dev/null 2>&1 || brew install stow

# Symlink dotfiles packages into $HOME
cd "$(dirname "$0")"
stow -v -t ~ fish git vscode
