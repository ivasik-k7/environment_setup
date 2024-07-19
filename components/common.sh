#!/usr/bin/env bash

is_installed() {
    command -v "$1" >/dev/null 2>&1
}

install_if_not_installed() {
    if ! is_installed "$1"; then
        echo "Installing $1..."
        sudo apt-get install -y "$2"
    else
        echo "$1 is already installed."
    fi
}