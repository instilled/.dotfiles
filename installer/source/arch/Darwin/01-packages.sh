#!/bin/bash -e

# brew
brew -h &> /dev/null || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update

# Fix manpath
# MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman

if [ -z "$1" -a ! "$(brew doctor &> /dev/null)" ]; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

formulae=(
  coreutils
  binutils
  grc
  gnu-sed
  gnu-tar
  gnu-which
  gawk
  grep
  findutils
  less
  git
  git-lfs
  openssh
  wget
  unzip
  zsh
  reattach-to-user-namespace
  cmake
  tmux
  watch
  maven
  mc
  #keybase
  gdub
  wireguard-tools
  mysql-client
  hub
)

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

taps=(
  adoptopenjdk/openjdk
)
for tap in "${taps[@]}"; do
  brew tap $tap
done

# Install casks
casks=(
  iterm2
  google-chrome
  firefox
  slack
  intellij-idea
  mendeley-desktop
  adoptopenjdk8
  adoptopenjdk13
)

for cask in "${casks[@]}"; do
  brew cask install $cask
done

