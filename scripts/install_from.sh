#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".packages.\"$MANAGER\"[]" </tmp/conf.yml)

clear_cache() {

    echo "=== Limpando cache ==="

    case "${1}" in
    'host')
        echo "Caches limpos"
        ;;
    *)
        paru -c --noconfirm
        ;;
    esac

}

if [ "$(command -v "$MANAGER")" ] || [ "$MANAGER" == "host" ] && [ ${#PACKAGES[@]} -gt 0 ]; then

    echo "=== Instalando pacotes via $MANAGER ==="

    case "${MANAGER}" in
    'host')
        bash /tmp/scripts/imports.sh "${PACKAGES[@]}"
        ;;
    *)
        paru -Syu --noconfirm "${PACKAGES[@]}"
        ;;
    esac

    clear_cache "$MANAGER"

fi
