#!/usr/bin/env bash

EXTENSIONS=(
  'wesbos.theme-cobalt2'
  'christian-kohler.path-intellisense'
  'christian-kohler.npm-intellisense'
  'kumar-harsh.graphql-for-vscode'
  'wix.vscode-import-cost'
  'jpoissonnier.vscode-styled-components'
  'sourcegraph.javascript-typescript'
  'formulahendry.auto-close-tag'
  'formulahendry.auto-rename-tag'
  'dbaeumer.vscode-eslint'
  'sleistner.vscode-fileutils'
)

for extension in "${EXTENSIONS[@]}"; do
  code --install-extension $extension
done