# This file is sourced when starting as a login shell.
# I use this file to set environment variables that rarely need to be changed
# and to autostart a graphical session.

# Define user directories according to XDG Base Directory Specification
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

# Workarounds for programs that don't fully support XDG Base Directory Specification
export LESSHISTFILE="-"
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Autostart X at login on TTY1
if [[ -z "$DISPLAY" ]] && [[ "$(tty)" = "/dev/tty1" ]]; then
    exec startx "$XDG_CONFIG_HOME/X11/xinitrc"
fi
