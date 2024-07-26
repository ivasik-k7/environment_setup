#!/usr/bin/env bash
# -*- coding: utf-8 -*-

set -euo pipefail

log() {
    echo "* [aws.sh] $1"
}

error_exit() {
    log "An error occurred. Exiting."
    exit 1
}

cleanup() {
    log "Cleaning up temporary files..."
    rm -f awscliv2.zip
    rm -rf aws
}

trap error_exit ERR

log "Checking for AWS CLI..."

if ! command -v aws &>/dev/null; then
    log "AWS CLI not found. Installing AWS CLI..."

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
        unzip awscliv2.zip &&
        sudo ./aws/install

    if command -v aws &>/dev/null; then
        log "AWS CLI installation successful."
        aws --version
    else
        log "AWS CLI installation failed."
        exit 1
    fi
else
    log "AWS CLI is already installed. Skipping installation."
fi

log "Checking for AWS CDK..."

if ! command -v cdk &>/dev/null; then
    log "AWS CDK not found. Installing AWS CDK..."

    if ! command -v node &>/dev/null; then
        log "Node.js not found. Please install Node.js to proceed with AWS CDK installation."
        exit 1
    else
        npm install -g aws-cdk &&
            cdk --version
    fi

else
    log "AWS CDK is already installed. Skipping installation."
fi
