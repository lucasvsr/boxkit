#!/usr/bin/env bash

set -oue pipefail

if [ -f "/opt/asdf-vm/asdf.sh" ]; then
    
    export ASDF_DATA_DIR=$HOME/.local/asdf
    . /opt/asdf-vm/asdf.sh

fi