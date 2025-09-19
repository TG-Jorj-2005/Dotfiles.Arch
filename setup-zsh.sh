#!/usr/bin/env bash

echo "🐚 Configurez zsh..."

# Verifică că zsh e instalat și setat
if [[ "$SHELL" != "/usr/bin/zsh" ]]; then
    echo "⚠️  Schimb shell-ul la zsh..."
    chsh -s /usr/bin/zsh
    echo "🔄 Fă logout/login pentru aplicarea schimbării"
fi

# Creează directorul pentru plugin-uri
ZSH_PLUGINS_DIR="$HOME/.config/zsh/plugins"
mkdir -p "$ZSH_PLUGINS_DIR"

# Instalează plugin-uri utile
plugins=(
    "https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting"
    "https://github.com/zsh-users/zsh-autosuggestions.git zsh-autosuggestions"
    "https://github.com/zsh-users/zsh-completions.git zsh-completions"
)

for plugin in "${plugins[@]}"; do
    url=$(echo $plugin | cut -d' ' -f1)
    name=$(echo $plugin | cut -d' ' -f2)
    
    if [[ ! -d "$ZSH_PLUGINS_DIR/$name" ]]; then
        echo "📦 Instalez $name..."
        git clone "$url" "$ZSH_PLUGINS_DIR/$name"
    fi
done

echo "✅ Zsh configurat cu succes!"
