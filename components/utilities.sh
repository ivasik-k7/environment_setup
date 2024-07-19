#!/usr/bin/env bash

source components/common.sh

set -e

echo "Installing essential utilities..."

echo "Installing super-user library"

install_if_not_installed sudo
install_if_not_installed curl
install_if_not_installed bash
install_if_not_installed wget
install_if_not_installed apt-transport-https
install_if_not_installed software-properties-common

sudo apt-get update