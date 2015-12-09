#!/bin/bash

FORCE_INSTALL=

dothome="$HOME/.dotfiles"
zhome="$dothome/zsh"
vhome="$dothome/vim"
thome="$dothome/tmux"
ghome="$dothome/git"
cdate=`date +%Y%m%d%H%M%S`

_repo="git@github.com:instilled/.dotfiles.git"

if [ ! -d "/Applications/Xcode.app" ]; then
    echo "Please install 'xcode' first!"
    exit 1
fi

echo "Hi there. I'm your dotfiles and will install myself at ~/.dotfiles."
echo "This will install a bunch of tools such as GNU command line tools and"
echo "other nice stuff provided by brew (check 'brew.sh' for a full list)."
echo "Finally I'll create a few symlinks in your home directory. Existing"
echo "files will of course be backed up for you."
echo

while true; do
    read -p "Is that ok? [y|n]: " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
    esac
done

# Clone the repo
echo "Cloning .dotfiles and initializing submodules..."
git clone $_repo "$dothome" &> /dev/null
(cd "$dothome" && git submodule update --init --recursive)

echo "Installing brew"
$dothome/brew.sh

function bkp() {
    echo "Baking up $HOME/$1 to $HOME/$1.bak.$cdate"
    if [ -a" $HOME/$1" ]; then
        mv "$HOME/$1" "$HOME/$1.bak.$cdate"
    fi
}

# ZSH
echo
echo "Installing zsh... ~/.zsh[,rc,env]"
bkp .zsh
ln -s "$zhome" "$HOME/.zsh"

bkp .zshrc
ln -s ".zsh/zshrc" "$HOME/.zshrc"

bkp .zshenv
ln -s ".zsh/zshenv" "$HOME/.zshenv"

# VIM
echo
echo "Installing vim... ~/.vim[,rc]"
bkp .vim
ln -s "$vhome" "$HOME/.vim"

bkp .vimrc
ln -s "$HOME/.vim/vimrc" "$HOME/.vimrc"

(cd ~/.vim/bundle/YouCompleteMe && python ./install.py)

# TMUX
echo
echo "Installing tmux... ~/.tmux[,.conf]"
bkp .tmux
ln -s "$thome" "$HOME/.tmux"

bkp .tmux.conf
ln -s ".tmux/tmux.conf" "$HOME/.tmux.conf"

echo
echo "Installing mc... ~/.mc"
bkp .mc
mkdir -p "$HOME/.config"
ln -s "$dothome/mc" "$HOME/.config/mc"

# Git
echo
echo "Configuring git..."
git config --global merge.tool vimdiff
ln -s "$ghome/gitconfig" "$HOME/.gitconfig"

# Others
echo
echo "Copying fonts"
cp -R $dothome'/fonts' "/Library/Fonts"

echo
echo "Done!"
