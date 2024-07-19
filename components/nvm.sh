#!/usr/bin/env bash

echo "Installing NVM..."

apt install -y curl && curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

echo "Verifying the version of NVM..."
nvm --version

nvm install 18.16.0
nvm install 16

nvm install --lts

nvm alias default 18.16.0

echo "Checking the version of the NodeJs"
node --version

echo "Installation completed..."