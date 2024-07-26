#!/usr/bin/env bash

set -e

BASHRC_PATH="$HOME/.bashrc"

log() {
    echo "* [python.sh] $1"
}

add_alias() {
    local alias_name="$1"
    local alias_value="$2"
    if alias "$alias_name" >/dev/null 2>&1; then
        log "Alias '$alias_name' already exists in the current session."
        return
    fi

    if ! grep -q "^alias $alias_name=" "$BASHRC_PATH"; then
        echo "alias $alias_name='$alias_value'" >>"$BASHRC_PATH"
        log "Alias '$alias_name' added to $BASHRC_PATH."
        # shellcheck disable=SC1090
        source "$BASHRC_PATH"
    else
        log "Alias '$alias_name' already exists in $BASHRC_PATH."
    fi
}

log "Installing Python..."

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
