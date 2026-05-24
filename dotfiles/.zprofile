# --- Environment setup ---
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim
export TERMINAL=kitty

# --- Wayland session autostart (Hyprland) ---
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" -eq 1 ]; then
    exec start-hyprland
fi
