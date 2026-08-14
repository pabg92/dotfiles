#!/usr/bin/env bash
set -euo pipefail

profile_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
timestamp="$(date +%Y%m%d-%H%M%S)"

install_dotfile() {
  local relative="$1" source="$profile_dir/$relative" target="$HOME/$relative"
  mkdir -p "$(dirname "$target")"
  if [[ -e "$target" && ! -L "$target" ]]; then
    cp -a "$target" "$target.bak.$timestamp"
  fi
  install -m "${2:-0644}" "$source" "$target"
}

install_dotfile .config/hypr/input.lua
install_dotfile .config/hypr/bindings.lua
install_dotfile .config/systemd/user/xps13-auto-rotate.service
install_dotfile .local/bin/xps13-auto-rotate 0755

omarchy powerprofiles set ac balanced
omarchy powerprofiles set battery power-saver

systemctl --user daemon-reload
systemctl --user enable --now xps13-auto-rotate.service

if hyprctl monitors >/dev/null 2>&1; then
  hyprctl reload
  errors="$(hyprctl configerrors)"
  if [[ -n "$errors" ]]; then
    printf 'Hyprland config errors:\n%s\n' "$errors" >&2
    exit 1
  fi
fi

printf 'Omarchy XPS 13 profile installed. Backups use suffix .bak.%s\n' "$timestamp"
