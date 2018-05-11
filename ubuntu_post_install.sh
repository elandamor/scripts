#!/usr/bin/env bash

APTS='
	chrome-gnome-shell
	fonts-firacode
	git
	gnome-tweak-tool
	powertop
	ubuntu-restricted-extras
'

REPOS='
	# TPL
	add-apt-repository -y ppa:linrunner/tlp universe
	# Yarn
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
'

SNAPS=(
	'communitheme'
	'gitkraken'
	'mailspring'
	'slack --classic'
	'spotify'
)

if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root" 
	exit 1
else
	# Update repo list and current software
	echo "Updating repositories and software..."
	apt-get update && apt-get upgrade -y
	
	# Dependencies
	echo "Installing dependencies..."
	# apt install -y --no-install-recommends curl gcc make libpng-dev
	
	# Install Node Version Manager
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	
	NVM=$(command -v nvm)

	if [ "$NVM" = "nvm" ]; then
		nvm install 8
	fi

	# Install Visual Studio Code
	curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
	mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
	sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	apt-get update
	apt-get install -y code

	# Yarn
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
	apt update
	apt install -y --no-install-recommends yarn
	
	# Install APTS
	apt install -y $APTS

	# Install SNAPS
	for app in "${SNAPS[@]}"; do
		snap install $app
	done

	# Install Google Chrome
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	apt update 
	apt install google-chrome-stable -y

	# Install uGet
	add-apt-repository -y ppa:plushuang-tw/uget-stable
	apt update
	apt install -y uget

	# Install VSCode Extensions
	# EXTENSIONS=(
	# 	'wesbos.theme-cobalt2'
	# 	'christian-kohler.path-intellisense'
	# 	'christian-kohler.npm-intellisense'
	# 	'kumar-harsh.graphql-for-vscode'
	# 	'wix.vscode-import-cost'
	# 	'jpoissonnier.vscode-styled-components'
	# 	'sourcegraph.javascript-typescript'
	# 	'formulahendry.auto-close-tag'
	# 	'formulahendry.auto-rename-tag'
	# 	'sleistner.vscode-fileutils'
	# )

	# for extension in "${EXTENSIONS[@]}"; do
	# 	code --install-extension $extension
	# done

	# Install extras
	if [ -d /sys/class/power_supply/BAT* ]; then
		echo "Installing TLP power management"
		sudo add-apt-repository -y ppa:linrunner/tlp
		sudo apt-get update
		apt-get -y install tlp
		service tlp start
	else
		echo "Battery not found. Will not install TLP"
	fi

	# Cleanup
	apt autoremove -y
	apt remove -y aisleriot gnome-mahjongg gnome-mines gnome-sudoku thunderbird ubuntu-web-launchers
fi
