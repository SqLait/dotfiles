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


function nfetch
    neofetch -c ~/.config/fastfetch/openbsd.jsonc $argv
end

function ts
    tmux-sessionizer
end

function zathura
    zathura-sandbox $argv
end
# function ls
#     eza --color=always --long --git --icons=always $argv
# end
