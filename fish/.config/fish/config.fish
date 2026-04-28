if status is-interactive
    set fish_greeting ""

    # alias sudo "run0 --background="
    if command -v tmux >/dev/null 2>&1
        and not set -q TMUX
        tmux
    end
    set -g fish_transient_prompt 1
end

source ~/.config/fish/functions/vi.fish
source ~/.config/fish/functions/fuzzy.fish
source ~/.config/fish/functions/abrv.fish
source ~/.config/fish/env/export.fish
source ~/.config/fish/env/path.fish
source ~/.config/fish/env/init.fish
source ~/.config/fish/themes/gruvbox.fish

fish_add_path /home/deanr/.spicetify

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/deanr/.ghcup/bin $PATH # ghcup-env
