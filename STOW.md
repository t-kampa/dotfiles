# Dotfiles via Stow

One tool at a time.

Layout: `dotfiles/<package>/` mirrors the target path under `$HOME`.

Example: `dotfiles/fish/.config/fish/config.fish` → symlinked to `~/.config/fish/config.fish`.

## Adopt a tool (4 steps)

```fish
cd ~/dotfiles

# 1. Mirror target path
mkdir -p ~/dotfiles/fish/.config/fish

# 2. Copy config in (original stays as fallback)
cp ~/.config/fish/config.fish ~/dotfiles/fish/.config/fish/

# 3. Dry run — check for conflicts
stow -n -v -t ~ fish

# 4. If conflict: move original aside, then stow for real
mv ~/.config/fish ~/.config/fish.bak
stow -v -t ~ fish

# 5. Verify
readlink ~/.config/fish/config.fish   # should point into ~/dotfiles
```

## Shortcut: `stow-adopt`

Does all 5 steps in one call:

```fish
stow-adopt fish .config/fish/config.fish .config/fish/fish_plugins
```

Defined in `fish/.config/fish/functions/stow-adopt.fish`.

After running: diff the `.bak` against the new symlinked file, then delete the `.bak`.

## New machine setup

`install.sh` runs `stow -v -t ~ fish`. Add new packages there so they land on fresh installs:

```bash
stow -v -t ~ fish <next-package>
```
