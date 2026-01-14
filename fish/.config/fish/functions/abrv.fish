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

# function ls
#     eza --color=always --long --git --icons=always $argv
# end
