#!/bin/bash

BREWS=(
  'yarn'
  'node'
  'git'
  'cask'
)

CASKS=(
  'zoomus'
  'visual-studio-code'
  'tunnelbear'
  'timing'
  'the-unarchiver'
  'spotify'
  'slack'
  'plex-media-server'
  'moom'
  'microsoft-edge'
  'google-chrome'
  'free-download-manager'
  'fork'
  'firefox'
  'docker'
  'copyclip'
  'blisk'
)

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Xcode Command Line Tools
xcode-select --install
# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

for brew in "${BREWS[@]}"; do
  brew install $brew
done

for cask in "${CASKS[@]}"; do
  brew cask install $cask
done

brew tap homebrew/cask-fonts
brew cask install font-fira-code

brew doctor
