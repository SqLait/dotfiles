#
#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

#=====================================Alias===================================
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

# Enable fs to work in Bash interactive mode
bind -x '"\C-f": fs'

#=====================================Init===================================
eval "$(oh-my-posh init bash --config $HOME/.config/ohmyposh/zengruv.toml)"
eval "$(zoxide init --cmd cd bash)"
#=====================================Startup===================================
tmux; clear;
#=====================================PATH===================================
# Set GHCUP_INSTALL_BASE_PREFIX if not already set
export GHCUP_INSTALL_BASE_PREFIX="${GHCUP_INSTALL_BASE_PREFIX:-$HOME}"

# Set PATH
export PATH="$HOME/.cabal/bin:/home/deanr/.ghcup/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/lf:$PATH"
export PATH="$HOME/.local/bin/C-scripts:$PATH"
export PATH="$HOME/.local/bin/Sh-scripts:$PATH"
export PATH="$HOME/.local/scripts/C-scripts:$PATH"
export PATH="$HOME/.local/scripts/Sh-scripts:$PATH"
export PATH="$HOME/.dotnet/tools:$PATH"
export PATH="$HOME/.config/ohmyposh/oh-my-posh/:$PATH"
export PATH="$HOME/.config/emacs/bin/:$PATH"
export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"

# QT scaling for Plasma
export PLASMA_USE_QT_SCALING="1"

# fzf preview command
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range=:500 {}'"

# SUDO alias equivalent
alias SUDO="run0 --background="

# Emacs directory variable
export EMACSDIR="$HOME/.config/emacs/"

# Use neovim for man pages
export MANPAGER="nvim +Man!"
#=====================================Export===================================
export EDITOR=vim
export NVIM_YANK=wl-copy
export NVIM_PASTE=wl-paste
export CC=clang
export CXX=clang++
export DEBUGINFOD_URLS="https://debuginfod.archlinux.org"
export DEBUGINFO_URLS="https://debuginfod.archlinux.org"
export BAT_THEME="gruvbox"

export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.jsonc=󰘦:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.lsp=:\
*.cmd=:\
*.ps1=󰨊:\
*.sh=:\
*.bash=󱆃:\
*.zsh=󱆃:\
*.fish=󰈺:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\ 
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
*.bash_history=:\
*.bash_logout=:\
*.bash_profile=:\
*.bashrc=:\
"
