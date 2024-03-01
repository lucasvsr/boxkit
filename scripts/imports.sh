#!/usr/bin/env bash

set -oue pipefail

PACKAGES_IMPORT=($@)

for PACKAGE in "${PACKAGES_IMPORT[@]}"; do

    echo "=== Importando o $PACKAGE do host ==="
    ln -fs /usr/bin/distrobox-host-exec "/usr/local/bin/$(echo "$PACKAGE" | tr -d '\n')"

done
