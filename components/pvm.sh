#!/usr/bin/env bash

set -e

source components/common.sh

echo "Installing Python..."

sudo apt-get update

install_if_not_installed python3
install_if_not_installed python3-pip

echo "Creating aliases..."

echo "alias python=python3" >> ~/.bashrc
echo "alias pip=pip3" >> ~/.bashrc
echo "alias py=python3" >> ~/.bashrc
echo "alias pp=pip3" >> ~/.bashrc

echo "Verifying Python installation..."
python --version
pip --version

# source ~/.bashrc

echo "Python installation complete."
