#!/usr/bin/env bash

set -e  # Oprește la prima eroare

echo "🚀 Instalez dotfiles..."

# Culori pentru output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Funcții helper
print_success() { echo -e "${GREEN}✅ $1${NC}"; }
print_error() { echo -e "${RED}❌ $1${NC}"; }
print_warning() { echo -e "${YELLOW}⚠️  $1${NC}"; }
print_info() { echo -e "${BLUE}ℹ️  $1${NC}"; }

# Verifică că suntem în directorul corect
if [[ ! -f "install.sh" ]]; then
    print_error "Rulează din directorul dotfiles!"
    exit 1
fi

# Backup configurările existente
backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
print_info "Creez backup în $backup_dir"
mkdir -p "$backup_dir"

# Lista fișierelor de backup
backup_files=(".zshrc" ".bashrc" ".vimrc" ".gitconfig" ".tmux.conf")
for file in "${backup_files[@]}"; do
    if [[ -f "$HOME/$file" ]] && [[ ! -L "$HOME/$file" ]]; then
        mv "$HOME/$file" "$backup_dir/"
        print_warning "Backup: $file"
    fi
done

# Backup .config directories
config_dirs=("alacritty" "nvim" "i3" "kitty")
for dir in "${config_dirs[@]}"; do
    if [[ -d "$HOME/.config/$dir" ]] && [[ ! -L "$HOME/.config/$dir" ]]; then
        mv "$HOME/.config/$dir" "$backup_dir/"
        print_warning "Backup: .config/$dir"
    fi
done

# Instalează stow dacă nu există
if ! command -v stow &> /dev/null; then
    print_info "Instalez GNU Stow..."
    sudo pacman -S stow
fi

# Creează symlink-urile
print_info "Creez symlink-urile cu stow..."
stow home
stow config

print_success "Dotfiles instalate cu succes!"
print_info "Pentru zsh: ./setup-zsh.sh"
print_info "Backup la: $backup_dir"
