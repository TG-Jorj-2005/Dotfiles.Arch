#!/usr/bin/env zsh

# Script pentru wallpaper GIF animat cu swww
# Salvează ca ~/.local/bin/swww-gif.sh

GIF_PATH="$HOME/Pictures/astro.gif"
FRAMES_DIR="$HOME/.cache/swww-frames"
DELAY=0.1  # Delay între frame-uri (în secunde)

# Funcție pentru cleanup
cleanup() {
    echo "Opresc animația wallpaper-ului..."
    pkill -f "swww-gif"
    exit 0
}

# Trap pentru oprire curată
trap cleanup SIGTERM SIGINT

# Verifică dacă swww daemon rulează
if ! pgrep swww-daemon > /dev/null; then
    echo "Pornesc swww-daemon..."
    swww-daemon &
    sleep 2
fi

# Creează directorul pentru frame-uri
mkdir -p "$FRAMES_DIR"

# Extrage frame-urile din GIF dacă nu există deja
if [ ! "$(ls -A "$FRAMES_DIR" 2>/dev/null)" ]; then
    echo "Extrag frame-urile din GIF..."
    ffmpeg -i "$GIF_PATH" -vf "scale=1920:1080:force_original_aspect_ratio=decrease,pad=1920:1080:(ow-iw)/2:(oh-ih)/2" "$FRAMES_DIR/frame_%04d.png" -y
    echo "Frame-urile au fost extrase în $FRAMES_DIR"
fi

# Obține numărul de frame-uri
FRAME_COUNT=$(ls "$FRAMES_DIR"/frame_*.png 2>/dev/null | wc -l)

if [ "$FRAME_COUNT" -eq 0 ]; then
    echo "Eroare: Nu s-au putut extrage frame-uri din GIF!"
    exit 1
fi

echo "Pornesc animația cu $FRAME_COUNT frame-uri..."
echo "Delay între frame-uri: ${DELAY}s"
echo "Pentru a opri: pkill -f swww-gif sau Ctrl+C"

# Loop infinit pentru animație
while true; do
    for frame in "$FRAMES_DIR"/frame_*.png; do
        if [ -f "$frame" ]; then
            swww img "$frame" --transition-type none
            sleep "$DELAY"
        fi
    done
done
