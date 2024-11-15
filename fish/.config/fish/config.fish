if status is-interactive
    set fish_greeting ""
    tmux; clear;
end

source ~/.config/fish/functions/vi.fish
source ~/.config/fish/functions/fuzzy.fish
source ~/.config/fish/functions/abrv.fish
source ~/.config/fish/env/export.fish
source ~/.config/fish/env/path.fish
source ~/.config/fish/env/init.fish
