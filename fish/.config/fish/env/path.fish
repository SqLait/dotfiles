set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin /home/deanr/.ghcup/bin $PATH # ghcup-env
set -x PLASMA_USE_QT_SCALING '1'
set -x PATH $HOME/.local/bin $PATH
set -x PATH $HOME/.config/lf $PATH
set -x PATH $HOME/.local/bin/C-scripts $PATH
set -x PATH $HOME/.local/bin/Sh-scripts $PATH
set -x PATH $HOME/.local/scripts/C-scripts $PATH
set -x PATH $HOME/.local/scripts/Sh-scripts $PATH
set -x PATH $HOME/.local/bin/Sh-scripts $PATH
set -x PATH $HOME/.local/bin/Sh-scripts/pomodoro-cli $PATH
set -x FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always --line-range=:500 {}'"
set -x PATH $HOME/.dotnet/tools $PATH
set -gx PATH "$HOME/.config/ohmyposh/oh-my-posh/" $PATH
set -Ux SUDO "run0 --background="
set -gx EMACSDIR "$HOME/.config/emacs/"
set -x PATH $HOME/.config/emacs/bin/ $PATH
set -x MANPAGER "nvim +Man!"
set -U fish_cursor_insert block
set -x PATH $HOME/.local/share/gem/ruby/3.4.0/bin $PATH
set -x PATH $HOME/Projects/libs/JLink_Linux_V872_x86_64/ $PATH
set -x PATH $HOME/Projects/libs/nrf-command-line-tools/bin/ $PATH
