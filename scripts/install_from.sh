#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".packages.\"$MANAGER\"[]" </tmp/conf.yml)

if [ "$(command -v "$MANAGER")" ] || [ "$MANAGER" == "host" ] && [ ${#PACKAGES[@]} -gt 0 ]; then

    echo "=== Instalando pacotes via $MANAGER ==="

    $MANAGER -Syu --noconfirm "${PACKAGES[@]}"

    echo "=== Limpando cache ==="

    case "${MANAGER}" in
    'yay')
        $MANAGER -Yc --noconfirm
        ;;
    'pacman')
        $MANAGER -Scc --noconfirm
        ;;
    *)
        bash /tmp/scripts/imports.sh "${PACKAGES[@]}"
        ;;
    esac

fi
