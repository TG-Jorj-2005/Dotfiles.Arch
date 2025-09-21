#!/bin/bash

#Dupa salvare dai comanda chmod +x install_depedns.sh si apoi ./install_depends.sh 
# Script pentru instalarea tuturor dependențelor pentru dotfiles
# Autor: Script generat pentru dotfiles Hyprland

set -e

echo "🚀 Instalez dependențele pentru dotfiles Hyprland..."

# Colors pentru output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check dacă rulează pe Arch Linux
if ! command -v pacman &> /dev/null; then
    print_error "Acest script este făcut pentru Arch Linux!"
    exit 1
fi

# Update system
print_status "Actualizez sistemul..."
sudo pacman -Syu --noconfirm

# Install base packages
print_status "Instalez pachetele de bază..."
sudo pacman -S --needed --noconfirm \
    base-devel \
    git \
    curl \
    wget \
    unzip \
    stow

# Install AUR helper (yay) if not present
if ! command -v yay &> /dev/null; then
    print_status "Instalez yay AUR helper..."
    cd /tmp
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si --noconfirm
    cd ~
fi

# ==================== HYPRLAND & WAYLAND ====================
print_status "Instalez Hyprland și componente Wayland..."
yay -S --needed --noconfirm \
    hyprland \
    xdg-desktop-portal-hyprland \
    xdg-desktop-portal-gtk \
    qt5-wayland \
    qt6-wayland \
    polkit-kde-agent \
    wlroots

# ==================== ALACRITTY ====================
print_status "Instalez Alacritty terminal..."
sudo pacman -S --needed --noconfirm alacritty

# ==================== WAYBAR ====================
print_status "Instalez Waybar..."
sudo pacman -S --needed --noconfirm waybar

# ==================== DUNST (Notifications) ====================
print_status "Instalez Dunst pentru notificări..."
sudo pacman -S --needed --noconfirm \
    dunst \
    libnotify

# ==================== NVIM ====================
print_status "Instalez Neovim și dependențe de sistem..."
sudo pacman -S --needed --noconfirm \
    neovim \
    nodejs \
    npm \
    python \
    python-pip \
    luarocks \
    ripgrep \
    fd \
    fzf

# LazyVim se va configura automat la prima pornire a Neovim

# ==================== ZSH & STARSHIP ====================
print_status "Instalez Zsh și Starship..."
sudo pacman -S --needed --noconfirm \
    zsh \
    zsh-completions \
    starship

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    print_status "Instalez Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Zsh plugins
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM}/plugins/zsh-autosuggestions
fi
if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM}/plugins/zsh-syntax-highlighting
fi

# ==================== GTK THEMES ====================
print_status "Instalez teme GTK și iconuri..."
yay -S --needed --noconfirm \
    nwg-look \
    lxappearance \
    arc-gtk-theme \
    papirus-icon-theme \
    catppuccin-gtk-theme-mocha \
    dracula-gtk-theme

# ==================== FONTS ====================
# Install nerd-fonts cu opțiunea default pentru toate întrebările
print_status "Instalez Nerd Fonts (va dura câteva minute)..."
echo -e "\n" | sudo pacman -S nerd-fonts
print_status "Sugerez Varianta default dar tu stii cel mai bine"

# ==================== AUDIO ====================
print_status "Instalez sistem audio..."
sudo pacman -S --needed --noconfirm \
    pipewire \
    pipewire-alsa \
    pipewire-pulse \
    pipewire-jack \
    wireplumber \
    pavucontrol

# ==================== UTILS & TOOLS ====================
print_status "Instalez utilitare generale..."
sudo pacman -S --needed --noconfirm \
    nautilus \
    nautilus-sendto \
    gvfs \
    gvfs-mtp \
    file-roller \
    firefox \
    brightnessctl \
    playerctl \
    grim \
    slurp \
    swappy \
    wl-clipboard \
    cliphist \
    tree \
    htop \
    btop \
    neofetch \
    fastfetch

yay -S --needed --noconfirm \
    nautilus-admin \
    swww \
    mpvpaper

# ==================== PROGRAMMING TOOLS ====================
print_status "Instalez tools pentru programare..."
sudo pacman -S --needed --noconfirm \
    code \
    docker \
    docker-compose \
    lazygit \
    github-cli

# ==================== MULTIMEDIA ====================
print_status "Instalez aplicații multimedia..."
sudo pacman -S --needed --noconfirm \
    mpv \
    vlc \
    gimp \
    obs-studio \
    ffmpeg

# ==================== SYSTEM SERVICES ====================
print_status "Activez serviciile de sistem..."
sudo systemctl enable docker
sudo usermod -aG docker $USER

print_success "🎉 Toate dependențele au fost instalate cu succes!"
print_success "Acum poți aplica dotfiles-urile cu stow."
