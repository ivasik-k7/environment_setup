#!/usr/bin/env bash

BASHRC_PATH=~/.bashrc

echo "Installing NVM..."

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

source "$BASHRC_PATH"

echo "Verifying the version of NVM..."
nvm --version

nvm install 18
nvm install 16

nvm alias default 18
nvm use 18

echo "Checking the version of the NodeJs"
nvm list
node --version

echo "Installation completed..."
