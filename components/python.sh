#!/usr/bin/env bash

set -e

BASHRC_PATH=~/.bashrc

echo "Installing Python..."

sudo apt-get install -y \
    python3 python3-pip

echo "Adding aliases to $BASHRC_PATH..."

{
    echo "alias python=python3"
    echo "alias pip=pip3"
    echo "alias py=python3"
    echo "alias pp=pip3"
} >>"$BASHRC_PATH"

echo "Aliases have been added successfully."

source "$BASHRC_PATH"

echo "Verifying Python installation..."
python --version
pip --version

echo "Python installation complete."
