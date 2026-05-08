# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If not running interactively, don't do anything
[[ -o interactive ]] || return

# source ~/.zsh/prompt
autoload -U select-word-style
select-word-style bash

PROMPT="%F{green}[%f%F{red}%n%f%F{yellow}@%f%F{green}%m%f:%F{cyan}%~%f%F{green}]%f%F{yellow}
❯%f "

source ~/.zsh/aliases
source ~/.zsh/init
source ~/.zsh/colours
source ~/.zsh/keybinds
source ~/.zsh/history

if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
    tmux
fi

source ~/.zsh/plugins
