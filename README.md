# Environment Enroller

This script automates the installation of essential utilities and additional components on an Ubuntu system. It provides a guided setup to install various tools and libraries that are commonly used in development environments.

## Features

- **Essential Utilities**: Installs basic utilities required for the setup.
- **Additional Components**: Offers choices for installing extra components like PowerShell, Python, Node.js, and AWS CLI.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Functions](#functions)
  - [display_instructions](#display_instructions)
  - [install_utilities](#install_utilities)
  - [install_powershell](#install_powershell)
  - [install_nvm_node](#install_nvm_node)
  - [install_python](#install_python)
  - [install_aws_cli](#install_aws_cli)
  - [select_components](#select_components)
- [Contributing](#contributing)
- [License](#license)

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/ivasik-k7/environment_setup.git .
   ```

2. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the script:

   ```bash
   ./setup.sh
   ```

## Usage

When you run the script, it will guide you through the installation process. The script performs the following tasks:

1. **Displays Instructions**: Provides an overview of the installation steps and options.
2. **Installs Essential Utilities**: Installs utilities required for the setup.
3. **Prompts for Additional Components**: Allows you to choose additional components to install.

## Functions

### `display_instructions`

Displays a welcome message with instructions on how to use the script. The message includes a stylized ASCII art and details about the installation steps.

### `install_utilities`

Updates the package list and installs essential utilities, including:

- `apt-transport-https`
- `bash`
- `curl`
- `git`
- `htop`
- `ncdu`
- `software-properties-common`
- `tree`
- `unzip`
- `vim`
- `wget`

Additionally, it sets up Git aliases for convenience.

### `install_powershell`

Installs PowerShell by:

1. Adding the Microsoft repository.
2. Updating package lists.
3. Installing the PowerShell package.
4. Verifying the installation by checking the version of PowerShell.

### `install_nvm_node`

Installs Node Version Manager (NVM) and uses it to:

1. Install Node.js versions 18 and 16.
2. Set Node.js 18 as the default version.
3. Verify the installation by checking Node.js versions.

### `install_python`

Installs Python 3 and `pip`, and adds the following aliases to `~/.bashrc`:

- `alias python=python3`
- `alias pip=pip3`
- `alias py=python3`
- `alias pp=pip3`

Verifies the Python installation by checking the Python and `pip` versions.

### `install_aws_cli`

Installs the AWS CLI and AWS CDK by:

1. Downloading and installing the AWS CLI.
2. Verifying the installation by checking the AWS CLI version.
3. Installing AWS CDK and verifying its version.

### `select_components`

Prompts the user to select additional components to install. The available choices are:

1. PowerShell
2. Python
3. Node.js
4. AWS CLI (requires Node.js)
5. None

The script installs the selected components based on user input.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your changes.
