#!/bin/zsh

autoload -Uz gitcommitwrapper
autoload -Uz gitident
autoload -Uz zutil

zstyle ':completion:*' completer _expand _complete _ignored _approximate

# See https://gist.github.com/ctechols/ca1035271ad134841284#gistcomment-2308206
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
  compdump
done
compinit -C

export HISTSIZE=1000
export SAVEHIST=1000 # only saved after logout
export HISTFILE=$HOME/.zshhist
setopt \
    inc_append_history \
    hist_save_no_dups \
    hist_reduce_blanks \
    hist_ignore_all_dups

setopt \
    autocd \
    extendedglob \
    notify \
    extendedhistory
    #completealiases
    #nomatch

