source ~/.zsh/path
source ~/.zsh/export

GPG_TTY=$(tty) 
export GPG_TTY
gpg-connect-agent updatestartuptty /bye >/dev/null
