# Dotfiles

Machine-specific desktop configuration profiles.

## Omarchy — Dell XPS 13 9310 2-in-1

The [`profiles/omarchy-xps13`](profiles/omarchy-xps13) profile adds:

- Three-finger horizontal workspace gestures
- Automatic internal-display and touchscreen rotation
- `Super+Alt+R` to toggle/lock automatic rotation
- Balanced power on AC and power-saver on battery
- A user systemd service that starts rotation with the graphical session

Install on an Omarchy XPS 13:

```bash
git clone https://github.com/pabg92/dotfiles.git
cd dotfiles
./profiles/omarchy-xps13/install.sh
```

The installer backs up replaced files with a timestamp before copying anything. The rotation helper uses `monitor-sensor` when available and falls back to the XPS's IIO accelerometer directly.

Hardware maintenance remains interactive:

```bash
omarchy update firmware
omarchy snapshot create
```

The XPS 13 9310 2-in-1 fingerprint reader is Goodix `27c6:532d`. It is detected as hardware but is not supported by `libfprint`; do not run Omarchy's fingerprint setup for this model.

## Fedora Asahi — MacBook Air

The root [`.config`](.config) directory contains the older Fedora Asahi Remix Hyprland and Kitty profile for an Apple Silicon MacBook Air.

Install that legacy profile with care—it is not intended for Omarchy:

```bash
cp -r .config/* ~/.config/
```
