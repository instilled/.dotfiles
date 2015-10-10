#!/bin/bash -e

# Credits: https://github.com/justincampbell/.dotfiles
which -s brew && brew update
which -s brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

if [ -z "$1" -a ! "$(brew doctor &> /dev/null)" ]; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew tap homebrew/binary
brew tap justincampbell/formulae
brew tap thoughtbot/formulae

formulae=(
  caskroom/cask/brew-cask
  git
  boot2docker
  reattach-to-user-namespace
  cmake
  ctags
  tmux
  wget
  watch
  maven
  "macvim --env-std --with-override-system-vim"
  coreutils
  mc
  the_silver_searcher
  gradle
  grc
  leiningen
  boot-clj
)

# More casks
# arq

casks=(
  1password
  dropbox
  flux
  iterm2
  launchrocket
  java
  nvalt
  skype
  mendeley-desktop
  telegram
  eclipse-java
  virtualbox
  vagrant
)

brew tap | grep "cask" > /dev/null || brew tap caskroom/homebrew-cask

for formula in "${formulae[@]}"; do
  brew install $formula || brew upgrade $formula
done

brew linkapps

for cask in "${casks[@]}"; do
  brew cask install $cask
done

