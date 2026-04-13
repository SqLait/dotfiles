# If not running interactively, don't do anything
[[ -o interactive ]] || return

# source ~/.sh_config/prompt
autoload -U select-word-style
select-word-style bash

PROMPT="%F{green}[%f%F{red}%n%f%F{yellow}@%f%F{green}%m%f:%F{cyan}%~%f%F{green}]%f
$ "
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

source ~/.sh_config/init
source ~/.sh_config/colours
source ~/.sh_config/plugins
source ~/.sh_config/keybinds
source ~/.sh_config/history

if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
    tmux
    clear
fi
