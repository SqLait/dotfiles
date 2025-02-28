# If not running interactively, don't do anything
[[ -o interactive ]] || return

alias grep='grep --color=auto'
PROMPT='[%n@%m %1~]%# '

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

# Enhanced ls using eza
ls() {
    eza --color=always --long --git --icons=always
}

# Enhanced tree using eza
tree() {
    eza --tree --color=always --git --icons=always --all
}

# Use btrman instead of man
man() {
    btrman "$@"
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

# Enable fs to work in Zsh interactive mode
bindkey "^F" fs

