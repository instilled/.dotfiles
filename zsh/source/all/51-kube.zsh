#!/bin/zsh

alias k='kubectl'
alias kg='k get'
alias kl='k logs'

source <(kubectl completion zsh)
complete -F __start_kubectl k
