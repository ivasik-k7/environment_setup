#!/usr/bin/env bash

BASHRC_PATH="$HOME/.bashrc"

log() {
    echo "* [nvm.sh] $1"
}

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
