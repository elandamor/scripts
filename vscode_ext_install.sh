#!/usr/bin/env bash

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

for extension in "${EXTENSIONS[@]}"; do
  code --install-extension $extension
done
