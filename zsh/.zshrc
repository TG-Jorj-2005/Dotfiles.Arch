
eval "$(starship init zsh)"
#EXPORTS
export EDITOR="nvim"
export HYPRSHOT_DIR="$HOME/Pictures/Screen_Shot/"
export ELECTRON_OZONE_PLATFORM_HINT=wayland

#NEOFETCH
neofetch

# FILE History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history

#FUNCTII
jrj(){
  git add .
  git commit -m "$(date)"
  git push
}


sys(){
 #UPDATE
 
 sudo pacman -S Syu
 
 #CLEAN CACHE
 
 sudo pacman -Sc --noconfirm
}

#Aliasuri
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'
