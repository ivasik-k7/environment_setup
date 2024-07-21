#!/usr/bin/env bash

set -e

sudo apt-get update -qq

wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"

sudo dpkg -i packages-microsoft-prod.deb

sudo apt-get update -qq

sudo apt-get install -y powershell

pwsh --version
