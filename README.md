# dotfiles

Personal dotfiles managed with [stow](https://www.gnu.org/software/stow/).

## Structure

```
common/   # shared across all machines
gui/      # graphical configs
arch/     # Arch Linux Hyprland
work/     # Fedora work laptop
nas/      # Fedora Server NAS
```

## Setup

```bash
git clone git@github.com:C-Valen/dotfiles.git ~/Dev/personal/dotfiles
cd ~/Dev/personal/dotfiles
./scripts/setup.sh <profile>   # arch | work | nas
```

Use `--dry-run` to preview before applying:
```bash
./scripts/setup.sh arch --dry-run
```
