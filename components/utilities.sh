#!/usr/bin/env bash

set -e

echo "Updating the repositories..."
apt-get update -qq

if ! command -v sudo &>/dev/null; then
    echo "Installing sudo..."
    apt-get install -y sudo
fi

echo "Installing essential utilities..."
sudo apt-get install -y \
    apt-transport-https \
    bash \
    curl \
    git \
    htop \
    ncdu \
    software-properties-common \
    tree \
    unzip \
    vim \
    wget

echo "Updating the repositories again..."
sudo apt-get update -qq

echo "Installation of utilities has been completed successfully..."
