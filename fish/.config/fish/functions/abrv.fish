function lg
    lazygit $argv
end

function vim
    nvim $argv
end

function vi
    command vim $argv
end

function neofetch
    fastfetch $argv
end

function edit
    vim $(fzf)
end

function fzf
    rg --files | command fzf $argv
end

function svim
    vim $(fzf)
end

function zathura
    zathura-sandbox $argv
end
# function ls
#     eza --color=always --long --git --icons=always $argv
# end

function tree
    eza --tree --color=always --git --icons=always --all $argv
end

function fman
    man -k . | fzf --preview="man {1}" | awk '{print $1}' | xargs -r -I {} nvim -c "Man {}"
end

function vvim
    NVIM_APPNAME=(fd --base-directory ~/.config 'nvim' | command fzf --prompt="Neovim Configs > " --height=~50% --layout=reverse --border --exit-0) nvim $argv
end
