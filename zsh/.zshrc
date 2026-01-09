# If not running interactively, don't do anything
[[ -o interactive ]] || return

source ~/.sh_config/prompt

# Alias lazygit
lg() {
    lazygit "$@"
}

# Alias Neovim
vim() {
    nvim "$@"
}

vi() {
    command vim "$@"
}

# Use fastfetch instead of neofetch
neofetch() {
    fastfetch "$@"
}

nfetch() {
    neofetch -c ~/.config/fastfetch/openbsd.jsonc "$@"
}

# Fuzzy search command history and insert into prompt
fs() {
    command=$(history | fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if [[ -n "$command" ]]; then
        READLINE_LINE="$command"
        READLINE_POINT=${#READLINE_LINE}
    fi
}

# Fuzzy search command history and execute immediately
fe() {
    command=$(history | fzf --preview '' | sed 's/^[ \t]*[0-9]*[ \t]*//')
    
    if [[ -n "$command" ]]; then
        eval "$command"
    fi
}

zathura() {
    zathura-sandbox "$@"
}

ts() {
    tmux-sessionizer
}

# Enable fs to work in Zsh interactive mode
bindkey "^F" yazi

source ~/.sh_config/init
source ~/.sh_config/colours
source ~/.sh_config/export
source ~/.sh_config/plugins
