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

function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

function incog
    switch $argv[1]
        case on
            set -g fish_private_mode 1
            echo "Incognito mode ON (history not saved)"
        case off
            set -e fish_private_mode
            echo "Incognito mode OFF (history saved)"
        case '*'
            if set -q fish_private_mode
                echo "Incognito mode is currently ON"
            else
                echo "Incognito mode is currently OFF"
            end
    end
end

# function ls
#     eza --color=always --long --git --icons=always $argv
# end
