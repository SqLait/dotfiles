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

function ls
    eza --color=always --long --git --icons=always $argv
end

function tree
    eza --tree --color=always --git --icons=always --all $argv
end

function fman
    man -k . | fzf --preview="man {1}" | awk '{print $1}' | xargs -r -I {} nvim -c "Man {}"
end

function cmake
    command cmake --build . $argv
end
