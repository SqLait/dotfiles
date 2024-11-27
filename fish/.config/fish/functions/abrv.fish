function lg
    lazygit $argv
end

function vim
    nvim $argv
end

function vi
    vim $argv
end

function neofetch
    fastfetch $argv
end

function ls
    eza --color=always --long --git --icons=always
end

function tree
    eza --tree --color=always --git --icons=always --all
end

function man
    btrman $argv
end

