if status is-interactive
  set fish_greeting ""
  # set -g catppuccin "catmocha"
  set -gx PATH "$HOME/.config/ohmyposh/oh-my-posh/" $PATH
end

source ~/.config/fish/functions/vi.fish
source ~/.config/fish/functions/fuzzy.fish
source ~/.config/fish/functions/abrv.fish
source ~/.config/fish/env/export.fish
source ~/.config/fish/env/path.fish
source ~/.config/fish/env/init.fish
