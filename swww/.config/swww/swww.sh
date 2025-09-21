/usr/bin/zsh
#start swww
WALLPAPERS_DIR=~/Pictures/
WALLPAPER=$(find "$WALLPAPERS_DIR" -type f | shuf -n 1)
swww img "$WALLPAPER"
