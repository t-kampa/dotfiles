# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). Each top-level directory is a stow package mirroring its target path under `$HOME`.

## Packages

- `brew/` — `Brewfile` with formulae and casks
- `fish/` — fish shell config, functions, plugins
- `git/` — git config (`.gitconfig.local` is machine-local, git-ignored)
- `vscode/` — VS Code settings, not stowed ([vscode/README.md](./vscode/README.md))

## Setup on a new machine

```bash
git clone <repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` installs Homebrew and Stow if missing, then symlinks all packages into `$HOME`.

## Adding a new tool

See [STOW.md](./STOW.md) for the adoption workflow (`stow-adopt`) and how to register a new package in `install.sh`.
