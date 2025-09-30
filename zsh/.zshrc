
eval "$(starship init zsh)"
#EXPORTS
export EDITOR="nvim"
export HYPRSHOT_DIR="$HOME/Pictures/Screen_Shot/"
export ELECTRON_OZONE_PLATFORM_HINT=wayland
export WINE_CPU_TOPOLOGY=12:0
export WINEFSYNC=1
export JAVAFX_HOME=/home/jorj/.cache/yay/java-openjfx-bin/src/javafx-sdk-24.0.2/lib

#NEOFETCH
neofetch


# FILE History
HISTFILE=~/.history
HISTSIZE=10000
SAVEHIST=50000

setopt inc_append_history
setopt HIST_FIND_NO_DUPS
setopt share_history


#FUNCTII
jrj(){
  git add .
  git commit -m "$(date)"
  git push
}
javacfx(){
  javac --module-path $JAVAFX_HOME --add-modules javafx.controls,javafx.fxml $1
}
javafx(){
  java --module-path $JAVAFX_HOME --add-modules javafx.controls,javafx.fxml $1
}


sys(){
 #UPDATE
 
 sudo pacman -S Syu
 
 #CLEAN CACHE
 
 sudo pacman -Sc --noconfirm
}

#Aliasuri
alias code='code --enable-features=UseOzonePlatform --ozone-platform=wayland'


