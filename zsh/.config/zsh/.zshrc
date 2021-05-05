# This file is sourced in interactive shells.
# Should be used to set up aliases, functions, options, key bindings, etc.

# Increase/Decrease verbosity of common commands
alias cp='cp -iv'
alias ffmpeg='ffmpeg -hide_banner'
alias mkd='mkdir -pv'
alias mv='mv -iv'
alias rm='rm -vI'
alias tree='tree -I ".git"'

# Common command shortcuts
alias g='git'
alias ll='ls -ahl'
alias ls='ls -N --color=auto --group-directories-first'
alias rr='ranger'
alias sc='shellcheck'
alias se='sudoedit'
alias um='udiskie-umount --detach'
alias vim='nvim'
alias vimdiff='nvim -d'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'
alias yt='youtube-dl --add-metadata -i'
alias yta='youtube-dl -x -f bestaudio/best'

# Functions
iptv() { mpv --script-opts=iptv=1 $1; } # Open an IPTV m3u playlist with mpv
ttv() { streamlink "https://twitch.tv/$1" "720p60,best" --player=mpv; } # Open a Twitch stream with mpv

# Zsh options
PROMPT='%F{blue}%B%~%b%f %F{yellow}❯%f '
HISTFILE="$XDG_DATA_HOME/zsh/history"
HISTSIZE=2000
SAVEHIST=2000
disable r # Disable the zsh built-in 'r' command (run previous executed command)
setopt interactive_comments # Allow comments (#) in interactive shells

# Enable Tab command completion
autoload -Uz compinit
zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # Better auto completion
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
_comp_options+=(globdots) # Show hidden files

# Enable command line editor
autoload -Uz edit-command-line
zle -N edit-command-line

# Enable vi mode
bindkey -v
KEYTIMEOUT=1 # Eliminate delay when entering normal mode

# Change cursor shape for different vi modes. This setup assumes the terminal is set to use the beam cursor style
function zle-keymap-select () {
    case $KEYMAP in
        viins|main) echo -ne '\e[6 q';; # Non-blinking beam
        vicmd)      echo -ne '\e[2 q';; # Non-blinking block
    esac
}
zle -N zle-keymap-select
zle-line-init() { zle -K viins; }
zle -N zle-line-init

# Key bindings
bindkey '^R' history-incremental-search-backward # Bash-like reverse search
bindkey '^?' backward-delete-char # Fix backspace not deleting previous text after switching to normal mode
# Vi navigation in command completion menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M vicmd v edit-command-line # Edit command in vim

# Enable syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[comment]='fg=08'
