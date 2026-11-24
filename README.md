# Dotfiles.Arch

> A personal Arch Linux workstation setup focused on a clean, keyboard-driven, developer-oriented workflow.

![Arch Linux](https://img.shields.io/badge/OS-Arch%20Linux-1793d1?style=for-the-badge&logo=arch-linux&logoColor=white)
![Hyprland](https://img.shields.io/badge/WM-Hyprland-00a3cc?style=for-the-badge&logo=hyprland&logoColor=white)
![Neovim](https://img.shields.io/badge/Editor-Neovim-57a143?style=for-the-badge&logo=neovim&logoColor=white)
![C++](https://img.shields.io/badge/Custom%20Tooling-C%2B%2B-00599c?style=for-the-badge&logo=cplusplus&logoColor=white)

My personal collection of configuration files, scripts, themes, and tooling for an
Arch Linux desktop built around **Hyprland**, **Wayland**, and a terminal-centric development workflow.

This repository is continuously evolving as I experiment with Linux customization,
developer tooling, automation, and workflow improvements.

---

[Watch the silent project video](https://tg-jorj-2005.github.io/proiecte/dotfiles-arch/#prezentare) · [MP4 file](docs/media/prezentare.mp4)

## ✨ Highlights

- 🐧 **Arch Linux** based environment
- 🪟 **Hyprland** Wayland compositor
- 🎨 **Catppuccin-inspired** visual configuration
- 💻 **Neovim** as the primary editor
- 🖥️ **Alacritty** terminal
- 📊 **Waybar** with custom modules
- 🎵 Custom **C++ Spotify/Media module** for Waybar
- 🚀 **Starship** prompt with development environment information
- 🐚 **Zsh + Oh My Zsh**
- 📑 **tmux** for terminal multiplexing
- 🔎 **Rofi** application launcher
- 🔔 **Dunst** notifications
- 🔐 **SDDM** configuration
- 📦 Automated dependency installation
- 🔗 GNU Stow-friendly directory structure

---

## 🖥️ Desktop Environment

The desktop is built around Hyprland and Wayland, with a strong focus on:

- keyboard-driven navigation
- minimal window decoration
- low visual overhead
- fast application launching
- terminal-based development
- workspace-oriented multitasking
- reproducible configuration

### Window Manager

**Hyprland** handles window management, workspaces, keybindings,
animations, input configuration, application rules, and wallpaper integration.

The configuration includes:

- Dwindle layout
- Custom workspace bindings
- Multi-key keyboard layout support (`us`, `ro`)
- Application-specific window rules
- Screenshot shortcuts
- Audio and brightness controls
- Scratchpad/special workspace functionality through `pypr`
- Animated wallpaper support through `mpvpaper` / `swww`
- Hyprlock integration

---

## 📂 Repository Structure

```text
.
├── Hyprland/
│   └── .config/hypr/
│       ├── hyprland.conf
│       ├── hyprlock.conf
│       ├── pyprland.toml
│       └── wallpaper/
│
├── alacritty/
│   └── .config/alacritty/
│       ├── alacritty.toml
│       └── catppuccin-mocha.toml
│
├── dunst/
│   └── .config/dunst/
│       └── dunstrc
│
├── gtk3/
│   └── .config/gtk-3.0/
│
├── neofetch/
│   └── .config/neofetch/
│
├── nvim/
│   └── .config/nvim/
│       ├── init.lua
│       ├── lua/
│       ├── lazy-lock.json
│       └── .stylua.toml
│
├── rofi/
│   └── .config/rofi/
│       └── config.rasi
│
├── sddm/
│   └── etc/
│       └── sddm.conf
│
├── starship/
│   └── .config/
│       └── starship.toml
│
├── tmux/
│   └── .tmux.conf
│
├── waybar/
│   └── .config/waybar/
│       ├── config.jsonc
│       ├── style.css
│       ├── spotify.cpp
│       └── spotify_waybar
│
├── zsh/
│   ├── .zshrc
│   └── .oh-my-zsh/
│
├── .stow-local-ignore
├── install_depends.sh
└── README.md
