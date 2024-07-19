#!/usr/bin/env bash

set -e

is_installed() {
    command -v "$1" >/dev/null 2>&1
}

install_if_not_installed() {
    if ! is_installed "$1"; then
        echo "Installing $1..."
        sudo apt-get install -y "$1"
    else
        echo "$1 is already installed."
    fi
}

echo "Installing PowerShell..."

install_if_not_installed sudo
install_if_not_installed wget
install_if_not_installed apt-transport-https
install_if_not_installed software-properties-common

wget -q "https://packages.microsoft.com/keys/microsoft.asc" -O- | sudo apt-key add -

wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -cs)/prod.list" -O /etc/apt/sources.list.d/microsoft-prod.list

sudo apt-get update
install_if_not_installed powershell

echo "Verifying PowerShell installation..."
pwsh --version

echo "PowerShell installation complete."