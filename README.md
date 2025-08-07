# Dotfiles

My personal configuration files for Fedora Asahi Linux on MacBook.

## Contents

- **Hyprland** - Wayland compositor configuration
- **Kitty** - Terminal emulator configuration

## Installation

```bash
git clone https://github.com/pabg92/dotfiles.git
cd dotfiles

# Backup existing configs
cp -r ~/.config/hypr ~/.config/hypr.backup
cp -r ~/.config/kitty ~/.config/kitty.backup

# Copy configs
cp -r .config/* ~/.config/
```

## System

- **OS**: Fedora Asahi Remix 42
- **Device**: MacBook (Apple Silicon)
- **Display**: 2560x1600