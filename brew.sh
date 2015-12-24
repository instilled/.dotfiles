#!/bin/bash -e

brew -h &> /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Fix manpath
# MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman

if [ -z "$1" -a ! "$(brew doctor &> /dev/null)" ]; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

taps=(
  homebrew/binary
  justincampbell/formulae
  thoughtbot/formulae
  homebrew/dupes
)

for tap in "${taps[@]}"; do
  brew tap $tap
done

formulae=(
  coreutils
  binutils
  "gnu-sed --with-default-names"
  "gnu-tar --with-default-names"
  "gnu-which --with-default-names"
  "grep --with-default-names"
  "findutils --with-default-names"
  gpg
  less
  git
  libsass
  openssh
  wget
  unzip
  zsh
  caskroom/cask/brew-cask
  emacs
  boot2docker
  reattach-to-user-namespace
  cmake
  ctags
  tmux
  watch
  maven
  "macvim --env-std --with-override-system-vim"
  mc
  the_silver_searcher
  grc
  leiningen
  keybase
  boot-clj
)

# More casks
# arq

casks=(
  iterm2
  java
  nvalt
  skype
  virtualbox
  vagrant
)

brew tap | grep "cask" > /dev/null || brew tap caskroom/homebrew-cask

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

brew linkapps

#for cask in "${casks[@]}"; do
#  brew cask install $cask
#done
