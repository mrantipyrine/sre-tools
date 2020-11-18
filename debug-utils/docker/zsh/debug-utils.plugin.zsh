# Settings

SAVEHIST=10000
TERM=xterm-256color
ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd)

# Aliases

alias h="history"
alias p="pushd"
alias o="popd"
alias hs="history | grep"
alias ls="ls -lh"

# Fix slow pasting with zsh-autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions/issues/238

pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}

zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
