#!/bin/bash

BREWS=(
  'yarn'
  'node'
  'git'
  'cask'
  'mysql'
  'postgresql'
)

CASKS=(
  'zoomus'
  'visual-studio-code'
  'tunnelbear'
  'timing'
  'the-unarchiver'
  'spotify'
  'slack'
  'rectangle'
  'postico'
  'microsoft-edge'
  'google-chrome'
  'free-download-manager'
  'fork'
  'firefox'
  'docker'
  'copyclip'
)

EXTENSIONS=(
  'apollographql.vscode-apollo'
  'formulahendry.auto-close-tag'
  'formulahendry.auto-rename-tag'
  'coenraads.bracket-pair-colorizer'
  'wesbos.theme-cobalt2'
  'deepscan.vscode-deepscan'
  'editorconfig.editorconfig'
  'sleistner.vscode-fileutils'
  'eamodio.gitlens'
  'wix.vscode-import-cost'
  'pkief.material-icon-theme'
  'christian-kohler.npm-intellisense'
  'christian-kohler.path-intellisense'
  'esbenp.prettier-vscode'
  'pflannery.vscode-versionlens'
  'jpoissonnier.vscode-styled-components'
)

# Xcode Command Line Tools
xcode-select --install
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
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

cat << EOF >> ~/.zshrc
# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

source ~/.zshrc

for extension in "${EXTENSIONS[@]}"; do
  code --install-extension $extension
done

brew doctor
