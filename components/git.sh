#!/usr/bin/env bash

set -e

# echo "Updating package lists..."
# sudo apt-get update

echo "Installing Git..."
sudo apt-get install -y git

echo "Verifying Git installation..."
git --version

echo "Setting up Git aliases..."
git config --global alias.a 'add .'
git config --global alias.pf 'push --force'

echo "Git installation complete."