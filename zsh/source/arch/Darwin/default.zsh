#!/bin/zsh

###>> SSH
# Handling of ssh identities is easier in OSx. ssh-agent has
# a keyring binding and will load all keys automatically when
# added with the -K option.

# Only add keys not yet loaded
if [[ -d $HOME/.ssh/keys-auto ]]; then
    for k in $(ls $HOME/.ssh/keys-auto)
    do
        _i=`ssh-add -l | grep "$k"`
        _loaded=$?

        if [ "$_loaded" -eq 1 ]; then
            ssh-add -k "$HOME/.ssh/keys-auto/$k"
        fi
    done
fi

###>> Colorized 'ls'
export LSCOLORS='cxfxcxdxbxegedabagacad'

PRMT_CLR=$PR_YELLOW

###>> Aliases
alias readlink='greadlink'
alias ls='ls -G'

alias o='open '
