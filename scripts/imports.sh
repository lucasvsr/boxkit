#!/usr/bin/env bash

set -oue pipefail

CONFIGURATIONS_FILE=/tmp/conf.yml

readarray PACKAGES_IMPORT < <(yq -o=j -I=0 '.imports.packages[]' "$CONFIGURATIONS_FILE")

for package in "${PACKAGES_IMPORT[@]}"; do

    echo "=== Importando o $package do host ==="
    ln -fs /usr/bin/distrobox-host-exec "/usr/local/bin/$(echo "$package" | tr -d '\n')"

done
