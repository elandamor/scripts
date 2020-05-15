#!/bin/bash

BREWS=(
  'yarn'
  'node'
  'git'
  'cask'
  'mysql'
  'postgresql'
  'lerna'
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
  'harvest'
  'google-chrome'
  'free-download-manager'
  'fork'
  'firefox'
  'docker'
  'copyclip'
)

EXTENSIONS=(
  # Apollo GraphQL
  'apollographql.vscode-apollo'
  # Auto Close Tag
  'formulahendry.auto-close-tag'
  # Auto Rename Tag
  'formulahendry.auto-rename-tag'
  # Better Comments
  'aaron-bond.better-comments'
  # Bracket Pair Colorizer
  'coenraads.bracket-pair-colorizer'
  # DeepScan
  'deepscan.vscode-deepscan'
  # Docker
  'ms-azuretools.vscode-docker'
  # EditorConfig for VS Code
  'editorconfig.editorconfig'
  # File Utils
  'sleistner.vscode-fileutils'
  # GitHub Pull Requests and Issues
  'github.vscode-pull-request-github'
  # GitHub Theme
  'github.github-vscode-theme'
  # GitLens
  'eamodio.gitlens'
  # Import Cost
  'wix.vscode-import-cost'
  # Material Icon Theme
  'pkief.material-icon-theme'
  # npm Intellisense
  'christian-kohler.npm-intellisense'
  # Path Intellisense
  'christian-kohler.path-intellisense'
  # Prettier Code Formatter
  'esbenp.prettier-vscode'
  # Settings Sync
  'shan.code-settings-sync'
  # Syntax highlighting for styled-components
  'jpoissonnier.vscode-styled-components'
  # Version Lens
  'pflannery.vscode-versionlens'
)

# Xcode Command Line Tools
xcode-select --install
# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install brews
for brew in "${BREWS[@]}"; do
  brew install $brew
done

# Install casks
for cask in "${CASKS[@]}"; do
  brew cask install $cask
done

# Install Fira Code font
brew tap homebrew/cask-fonts
brew cask install font-fira-code

# Add command line aliases for Oh My Zsh
cat << EOF >> ~/.zshrc
# docker
alias dc="docker-compose"
alias dcd="docker-compose down"
alias dcu="docker-compose up"

# git
alias ga="git add"
alias gb="git branch"
alias gbd="git branch -d"
alias gc="git commit -v"
alias gcb="git checkout -b"
alias gcd="git checkout develop"
alias gcm="git checkout master"
alias gco="git checkout"
alias gf="git fetch"
alias gl="git pull"
alias gp="git push"
alias gm="git merge"
alias gma="git merge --abort"
alias gmd="git merge develop"
alias gs="git status"


# npm
alias npm="npm install"
alias "npm add"="npm"

# Add Visual Studio Code (code)
export PATH="\$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
EOF

source ~/.zshrc

# Install VS Code extensions
for extension in "${EXTENSIONS[@]}"; do
  code --install-extension $extension
done

brew doctor
