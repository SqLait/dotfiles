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

setopt PROMPT_SUBST
# old prompt
# PROMPT='%F{red}[%f%F{yellow}%n%f%F{green}@%f%F{blue}%m%f %F{magenta}%~%f%F{red}] %(?.%F{green}.%F{red}[%?] )%f
# %(?.%F{green}❯.%F{red}❯)%f '

PROMPT='%F{green}%~%f %(?.%F{green}.%F{magenta}[%?] )%f
%(?.%F{yellow}$.%F{red}$)%f '

source ~/.zsh/aliases
source ~/.zsh/init
source ~/.zsh/colours
source ~/.zsh/keybinds
source ~/.zsh/history
source ~/.zsh/extra

if [[ -o interactive ]] && [[ -z "$TMUX" ]]; then
    tmux
fi

if [ -n "$TTY" ]; then
  export GPG_TTY=$(tty)
else
  export GPG_TTY="$TTY"
fi

source ~/.zsh/plugins
