#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  echo "Usage: $0 <profile>"
  echo ""
  echo "Profiles:"
  echo "  arch   — Arch Linux + Hyprland (personal desktop)"
  echo "  work   — Fedora (work laptop)"
  echo "  nas    — Fedora Server (NAS)"
  exit 1
}

stow_layer() {
  local layer="$1"
  local layer_dir="$DOTFILES_DIR/$layer"

  if [[ ! -d "$layer_dir" ]]; then
    echo "Layer '$layer' not found at $layer_dir, skipping."
    return
  fi

  for pkg in "$layer_dir"/*/; do
    pkg_name="$(basename "$pkg")"
    echo "  stowing $layer/$pkg_name"
    stow --dir="$layer_dir" --target="$HOME" --restow "$pkg_name"
  done
}

[[ $# -lt 1 ]] && usage

PROFILE="$1"

echo "Setting up dotfiles for profile: $PROFILE"
echo ""

case "$PROFILE" in
  arch)
    stow_layer common
    stow_layer gui
    stow_layer arch
    ;;
  work)
    stow_layer common
    stow_layer gui
    stow_layer work
    ;;
  nas)
    stow_layer common
    stow_layer nas
    ;;
  *)
    echo "Unknown profile: $PROFILE"
    usage
    ;;
esac

echo ""
echo "Done. Dotfiles for '$PROFILE' are linked."
