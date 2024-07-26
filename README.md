# Environment Enroller

The Environment Enroller is designed to streamline the setup of a development environment on Unix-like operating systems. The script starts by displaying a welcome message and then proceeds to install a variety of essential tools and packages. It installs utilities such as `curl`, `git`, and `vim`, ensuring that the basic tools needed for development are available. Next, it sets up Python3 with convenient aliases for ease of use. The script then installs NVM (Node Version Manager) and Node.js, allowing for the management of multiple Node.js versions, with Node.js 18 set as the default. Finally, it installs the AWS CLI and AWS CDK if they are not already present, enabling you to manage AWS services and infrastructure directly from your command line. This setup script is ideal for developers who need a consistent and efficient way to prepare their environment for development work.

## Table of Contents

- [Features](#features)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Script Breakdown](#script-breakdown)
  - [`display_welcome`](#display_welcome)
  - [`log`](#log)
  - [`install_utilities`](#install_utilities)
  - [`install_python`](#install_python)
  - [`install_nvm_node`](#install_nvm_node)
  - [`install_aws_cli`](#install_aws_cli)
- [License](#license)
- [Contact](#contact)

## Features

- **Essential Utilities**: Installs a suite of essential utilities for your development environment.
- **Python**: Sets up Python with convenient aliases.
- **NVM & Node.js**: Installs Node Version Manager (NVM) and multiple versions of Node.js.
- **AWS CLI**: Installs the AWS Command Line Interface and AWS Cloud Development Kit (CDK).

## Prerequisites

- A Unix-like operating system (e.g., Linux, macOS)
- Basic knowledge of running shell scripts
- Internet connection for downloading dependencies

## Installation

1. Receive the source

- Clone the repository:

  ```bash
  git clone https://github.com/ivasik-k7/environment_setup.git .
  ```

- Download script file
  ```bash
  curl -o setup.sh https://raw.githubusercontent.com/ivasik-k7/environment_setup/main/setup.sh
  ```

2. Make the script executable:

   ```bash
   chmod +x setup.sh
   ```

3. Run the script:

   ```sh
   ./setup.sh
   ```

## Script Breakdown

### `display_welcome`

Displays a welcome message with a brief overview of what the script will do.

### `log`

Logs messages to the console to provide feedback during the script's execution.

### `install_utilities`

- Updates the package repositories.
- Installs `sudo` if it's not already installed.
- Installs a list of essential utilities.
- Configures Git aliases for convenience.

### `install_python`

- Adds aliases for Python3 and pip3.
- Verifies the installation of Python and pip.

### `install_nvm_node`

- Installs NVM (Node Version Manager).
- Loads NVM and installs Node.js versions 18 and 16.
- Sets Node.js 18 as the default version.

### `install_aws_cli`

- Checks for AWS CLI and installs it if not found.
- Checks for AWS CDK and installs it if not found.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or assistance, please reach out to [Ivan Kovtun](mailto:jeanlacroix@ukr.net)
