#!/usr/bin/env bash

set -e

log() {
    echo "* [utilities.sh] $1"
}

log "Updating the repositories..."

if ! command -v sudo &>/dev/null; then
    log "Installing sudo..."
    apt-get install -y sudo
fi

sudo apt-get update -qq

log "Installing essential utilities..."
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

log "Refreshing the repositories..."
sudo apt-get update -qq

log "Setting up Git aliases..."
git config --global alias.a 'add .'
git config --global alias.pf 'push --force'
git config --global alias.amne 'commit --amend --no-edit'
git config --global alias.ca 'commit --amend -m'

log "Installation of utilities has been completed successfully..."
