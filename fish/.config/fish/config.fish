if status is-interactive
    set fish_greeting ""

    # alias sudo "run0 --background="
    tmux; clear;
end

source ~/.config/fish/functions/vi.fish
source ~/.config/fish/functions/fuzzy.fish
source ~/.config/fish/functions/abrv.fish
source ~/.config/fish/env/export.fish
source ~/.config/fish/env/path.fish
source ~/.config/fish/env/init.fish
