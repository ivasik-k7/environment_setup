#!/usr/bin/env bash
# -*- coding: utf-8 -*-

BASHRC_PATH="$HOME/.bashrc"

display_welcome() {
    clear
    echo "*************************************************"
    echo "*     _        _                                *"
    echo "*    / \\   ___| |_ __ ___  __ _ _ __ ___        *"
    echo "*   / _ \\ / __| | '__/ _ \\/ _\` | '_ \` _ \\       *"
    echo "*  / ___ \\ (__| | | |  __/ (_| | | | | | |      *"
    echo "* /_/   \\_\\___|_|_|  \\___|\\__,_|_| |_| |_|      *"
    echo "*                                               *"
    echo "* Welcome to the setup script!                  *"
    echo "* This script will install essential utilities, *"
    echo "* Python, NVM & Node.js, and AWS CLI.           *"
    echo "* If you have any questions, please contact,    *"
    echo "* Ivan Kovtun<ivan.kovtun@capgemini.com>        *"
    echo "*************************************************"
}

log() {
    echo "* [setup.sh] $1"
}


install_utilities() {
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
}

install_python() {
    log "Installing Python..."

    add_alias() {
        local alias_name="$1"
        local alias_value="$2"
        if alias "$alias_name" >/dev/null 2>&1; then
            log "Alias '$alias_name' already exists in the current session."
            return
        fi
    
        if ! grep -q "^alias $alias_name=" "$BASHRC_PATH"; then
            echo "alias $alias_name='$alias_value'" >> "$BASHRC_PATH"
            log "Alias '$alias_name' added to $BASHRC_PATH."
            # shellcheck disable=SC1090
            source "$BASHRC_PATH"
        else
            log "Alias '$alias_name' already exists in $BASHRC_PATH."
        fi
    }

    add_alias python python3
    add_alias py python3
    add_alias pip pip3
    add_alias pp pip3

    log "Aliases have been added successfully."

    # shellcheck disable=SC1090
    source "$BASHRC_PATH"

    log "Verifying Python installation..."
    log "$(python3 --version)"
    log "$(pip --version)"

    log "Python installation complete."
}

install_nvm_node() {
    log "Installing NVM..."

    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

    export NVM_DIR="$HOME/.nvm"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    # shellcheck disable=SC1091
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

    # shellcheck disable=SC1090
    source "$BASHRC_PATH"

    log "Verifying the version of NVM..."
    log "NVM: $(nvm --version)"

    nvm install 18
    nvm install 16

    nvm alias default 18
    nvm use 18

    log "Checking the version of the NodeJs"
    nvm list
    log "NodeJs: $(node --version)"

    # shellcheck disable=SC1090
    source "$BASHRC_PATH"

    log "Installation completed..."
}

install_aws_cli() {
    log "Checking for AWS CLI..."

    if ! command -v aws &> /dev/null; then
        log "AWS CLI not found. Installing AWS CLI..."

        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
            unzip awscliv2.zip &&
            sudo ./aws/install

        aws --version
    else
        log "AWS CLI is already installed. Skipping installation."
    fi

    log "Checking for AWS CDK..."

    if ! command -v cdk &> /dev/null; then
        log "AWS CDK not found. Installing AWS CDK..."

        npm install -g aws-cdk &&
            cdk --version
    else
        log "AWS CDK is already installed. Skipping installation."
    fi
}

display_welcome

install_utilities

install_python

install_nvm_node

install_aws_cli
