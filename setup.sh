#!/usr/bin/env bash
# PROFILE
BASHRC_PATH=~/.bashrc

# COLORS
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'

display_instructions() {
    printf "$RED"
    cat <<"EOF"

                ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣶⣶⠖⠀⠀⠲⣶⣶⣤⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⡿⠋⠀⠀⠀⠀⠀⠀⠙⢿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⢀⣾⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⣾⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣷⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⠀⠀⣿⣿⣿⣇⣤⠶⠛⣛⣉⣙⡛⠛⢶⣄⣸⣿⣿⣿⠀⠀⠀⠀⠀⠀
                ⠀⠀⠀⠀⢀⣀⣿⣿⣿⡟⢁⣴⣿⣿⣿⣿⣿⣿⣦⡈⢿⣿⣿⣿⣀⡀⠀⠀⠀⠀
                ⠀⠀⢠⣴⣿⣿⣿⣿⡟⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡌⢿⣿⣿⣿⣿⣦⡄⠀⠀
                ⠀⣴⣿⣿⡿⠿⢛⣻⡇⢸⡟⠻⣿⣿⣿⣿⣿⡿⠟⢻⡇⣸⣛⡛⠿⣿⣿⣿⣦⠀
                ⢸⣿⡿⠋⠀⠀⢸⣿⣿⡜⢧⣄⣀⣉⡿⣿⣉⣀⣠⣼⢁⣿⣿⡇⠀⠀⠙⢿⣿⡆
                ⣿⣿⠁⠀⠀⠀⠈⣿⣿⡇⣿⡿⠛⣿⣵⣮⣿⡟⢻⡿⢨⣿⣿⠀⠀⠀⠀⠈⣿⣿
                ⢿⡟⠀⠀⠀⠀⠀⠘⣿⣷⣤⣄⡀⣿⣿⣿⣿⢁⣤⣶⣿⣿⠃⠀⠀⠀⠀⠀⣿⡟
                ⠘⠇⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⡇⢿⣿⣿⣿⢸⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⠻⠃
                ⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⢩⣦⣘⡘⠋⣛⣸⡍⠁⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀
                ⠀⠀⠘⢿⣷⣤⣤⣄⣤⣤⣶⣿⣿⣿⡿⢿⣿⣿⣿⣷⣤⣤⣠⣤⣴⣾⡿⠁⠀⠀
                ⠀⠀⠀⠀⠉⠛⠿⠿⠿⡿⠿⠿⠛⠉⠀⠀⠉⠛⠿⠿⣿⠿⠿⠿⠛⠉⠀

                ⠀⠀
EOF
    printf "${NC}"
    echo -e "${BLUE}==================================================${NC}"
    echo -e "${BLUE}                  WELCOME TO THE INSTALLER      ${NC}"
    echo -e "${BLUE}==================================================${NC}"
    echo
    echo -e "${YELLOW}This script will guide you through the installation process.${NC}"
    echo
    echo -e "${GREEN}Step 1:${NC} ${RED}Essential Utilities${NC}"
    echo -e "We'll install some essential utilities required for the setup."
    echo
    echo -e "${GREEN}Step 2:${NC} ${RED}Additional Components${NC}"
    echo -e "After that, you'll have a choice of additional components to install."
    echo -e "Please select the components you wish to install by entering the corresponding answer."
    echo
    echo -e "${BLUE}==================================================${NC}"
    echo
}

install_utilities() {
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

    echo "Setting up Git aliases..."
    git config --global alias.a 'add .'
    git config --global alias.pf 'push --force'
    git config --global alias.amne 'commit --amend --no-edit'
    git config --global alias.ca 'commit --amend -m'

    echo "Installation of utilities has been completed successfully..."
}

install_powershell() {
    sudo apt-get update -qq

    wget -q "https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb"

    sudo dpkg -i packages-microsoft-prod.deb

    sudo apt-get update -qq

    sudo apt-get install -y powershell

    pwsh --version
}

install_nvm_node() {
    echo "Installing NVM..."

    curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

    source "$BASHRC_PATH"

    echo "Verifying the version of NVM..."
    nvm --version

    nvm install 18
    nvm install 16

    nvm alias default 18
    nvm use 18

    echo "Checking the version of the NodeJs"
    nvm list
    node --version

    echo "Installation completed..."
}

install_python() {
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
}

install_aws_cli() {
    echo "Installing of AWS CLI..."

    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" &&
        unzip awscliv2.zip &&
        sudo ./aws/install

    aws --version

    npm install -g aws-cdk &&
        cdk --version
}

select_components() {
    echo "Please choose additional components to install (separate multiple choices with commas):"
    echo "1) PowerShell"
    echo "2) Python"
    echo "3) NodeJs"
    echo "4) AWS (Node Required)"
    echo "5) None"

    read -p "Enter your choices (e.g., 1,2,3,4 or 5): " choices

    IFS=',' read -r -a choices_array <<<"$choices"

    for choice in "${choices_array[@]}"; do
        case $choice in
        1)
            install_powershell
            ;;
        2)
            install_python
            ;;
        3)
            install_nvm_node
            ;;
        4)
            if command -v node &>/dev/null; then
                install_aws_cli
            else
                echo "AWS installation failed or NodeJs not found."
            fi
            ;;
        5)
            echo "No additional components will be installed."
            return
            ;;
        *)
            echo "Invalid choice: $choice. Skipping..."
            ;;
        esac
    done
}

display_instructions

install_utilities
select_components
