#!/usr/bin/env bash

set -e

if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Exiting."
    echo "To complete that operation you need to install Node | npm..."
    exit 1
fi

npm install -g aws-cdk && \
    cdk --version