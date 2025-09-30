#!/bin/bash
# Script pentru instalarea dependențelor pentru dotfiles Hyprland
# Doar instalează pachete - configurarea se face manual cu stow

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

print_status() { echo -e "${BLUE}[INFO]${NC} $1"; }
print_success() { echo -e "${GREEN}[SUCCESS]${NC} $1"; }
print_error() { echo -e "${RED}[ERROR]${NC} $1"; }

# Check Arch Linux
if ! command -v pacman &>/dev/null; then
  print_error "Script pentru Arch Linux!"
  exit 1
fi

# Update system
print_status "Actualizare sistem..."
sudo pacman -Syu --noconfirm

# Base packages
print_status "Pachete de bază..."
sudo pacman -S --needed --noconfirm \
  base-devel git curl wget unzip stow

# Install yay
if ! command -v yay &>/dev/null; then
  print_status "Instalare yay..."
  cd /tmp
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ~
fi

# ==================== HYPRLAND ====================
print_status "Hyprland și Wayland..."
sudo pacman -S --needed --noconfirm \
  hyprland \
  xdg-desktop-portal-hyprland \
  xdg-desktop-portal-gtk \
  qt5-wayland \
  qt6-wayland \
  polkit \
  polkit-kde-agent \
  lxqt-policykit \
  wayland \
  xorg-xwayland

# ==================== ALACRITTY ====================
print_status "Alacritty..."
sudo pacman -S --needed --noconfirm alacritty

# ==================== WAYBAR ====================
print_status "Waybar și dependențe..."
sudo pacman -S --needed --noconfirm \
  waybar \
  playerctl \
  pamixer \
  brightnessctl \
  gcc \
  make

# ==================== DUNST ====================
print_status "Dunst..."
sudo pacman -S --needed --noconfirm \
  dunst \
  libnotify

# ==================== ROFI ====================
print_status "Rofi..."
sudo pacman -S --needed --noconfirm rofi-wayland

# ==================== NEOVIM ====================
print_status "Neovim și dependențe..."
sudo pacman -S --needed --noconfirm \
  neovim \
  nodejs \
  npm \
  python \
  python-pip \
  luarocks \
  ripgrep \
  fd \
  fzf \
  lazygit \
  tree-sitter \
  tree-sitter-cli \
  lua \
  stylua

# ==================== TMUX ====================
print_status "Tmux..."
sudo pacman -S --needed --noconfirm tmux

# ==================== ZSH & STARSHIP ====================
print_status "Zsh și Starship..."
sudo pacman -S --needed --noconfirm \
  zsh \
  zsh-completions \
  zsh-syntax-highlighting \
  zsh-autosuggestions \
  starship

# ==================== NEOFETCH ====================
print_status "Neofetch..."
sudo pacman -S --needed --noconfirm neofetch

# ==================== GTK/QT ====================
print_status "Teme GTK/QT..."
sudo pacman -S --needed --noconfirm \
  gtk3 \
  gtk4 \
  qt5ct \
  qt6ct \
  kvantum \
  dracula-gtk-theme \
  papirus-icon-theme \
  lxappearance

# ==================== FONTS ====================
print_status "Fonturi..."
sudo pacman -S --needed --noconfirm \
  ttf-firacode-nerd \
  ttf-jetbrains-mono-nerd \
  ttf-font-awesome \
  noto-fonts \
  noto-fonts-emoji

# ==================== AUDIO ====================
print_status "Audio..."
sudo pacman -S --needed --noconfirm \
  pipewire \
  pipewire-alsa \
  pipewire-pulse \
  pipewire-jack \
  wireplumber \
  pavucontrol

# ==================== WALLPAPER ====================
print_status "Wallpaper tools..."
sudo pacman -S --needed --noconfirm \
  imagemagick \
  ffmpeg

yay -S --needed --noconfirm \
  swww \
  mpvpaper-git

# ==================== SCREENSHOTS ====================
print_status "Screenshot tools..."
sudo pacman -S --needed --noconfirm \
  grim \
  slurp \
  wl-clipboard \
  flameshot

yay -S --needed --noconfirm grimblast-git

# ==================== NETWORK & BLUETOOTH ====================
print_status "Network și Bluetooth..."
sudo pacman -S --needed --noconfirm \
  networkmanager \
  network-manager-applet \
  nm-connection-editor \
  bluez \
  bluez-utils \
  blueman

# ==================== UTILITIES ====================
print_status "Utilitare..."
sudo pacman -S --needed --noconfirm \
  dolphin \
  htop \
  btop \
  tree

# ==================== ENABLE SERVICES ====================
print_status "Activare servicii..."
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now bluetooth.service

print_success "================================"
print_success "Instalare completă!"
print_success "================================"
echo ""
echo "Dependențe instalate. Pași următori:"
echo "1. cd ~/Dotfiles.Arch"
echo "2. stow alacritty waybar hyprland nvim tmux zsh (etc.)"
echo "3. Restart sau relogin"
