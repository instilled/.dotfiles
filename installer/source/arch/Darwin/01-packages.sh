#!/bin/bash -e

# brew
brew -h &> /dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# Fix manpath
# MANPATH_MAP /usr/local/opt/coreutils/libexec/gnubin /usr/local/opt/coreutils/libexec/gnuman

if [ -z "$1" -a ! "$(brew doctor &> /dev/null)" ]; then
  echo "\`brew doctor\` failed. Please resolve issues before continuing."
  exit 1
fi

brew bundle --file=- <<-EOS
brew "coreutils"
brew "binutils"
brew "grc"
brew "gnu-sed"
brew "gnu-tar"
brew "gnu-which"
brew "gawk"
brew "grep"
brew "findutils"
brew "less"
brew "git"
brew "git-lfs"
brew "openssh"
brew "wget"
brew "unzip"
brew "zsh"
brew "reattach-to-user-namespace"
brew "cmake"
brew "tmux"
brew "watch"
brew "maven"
brew "mc"
brew "gdub"
brew "wireguard-tools"
brew "mysql-client"
brew "hub"
brew "mas"
brew "kubernetes-cli"
brew "helm@2"
brew "kubectx"
EOS

taps=(
  adoptopenjdk/openjdk
)
for tap in "${taps[@]}"; do
  brew tap $tap
done

# Install casks
casks=(
#  iterm2
#  google-chrome
#  firefox
  #slack
#  intellij-idea
  google-cloud-sdk
  alfred
  mendeley
  adoptopenjdk8
  adoptopenjdk13
)

for cask in "${casks[@]}"; do
  brew cask install $cask
done

mass=(
  937984704  # amphetamine
  441258766  # magnet
)

for m in "${mass[@]}"; do
  mas install $m
done


for cask in "${casks[@]}"; do
  brew cask install $cask
done


