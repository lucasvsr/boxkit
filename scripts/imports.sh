#!/usr/bin/env bash

set -oue pipefail

CONFIGURATIONS_FILE=/tmp/conf.yml

readarray PACKAGES_IMPORT < <(yq -o=j -I=0 '.imports.packages[]' "$CONFIGURATIONS_FILE")

for package in "${PACKAGES_IMPORT[@]}"; do
    
    ln -fs /usr/bin/distrobox-host-exec "$package"

done
