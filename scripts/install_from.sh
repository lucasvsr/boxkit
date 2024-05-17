#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".packages.\"$MANAGER\"[]" </tmp/conf.yml)

clear_cache() {

    echo "=== Limpando cache ==="

    case "${1}" in
    'yay')
        $1 -Yc --noconfirm
        ;;
    'pacman')
        $1 -Scc --noconfirm
        ;;
    *)
        echo "Caches limpos"
        ;;
    esac
    
}

if [ "$(command -v "$MANAGER")" ] || [ "$MANAGER" == "host" ] && [ ${#PACKAGES[@]} -gt 0 ]; then

    echo "=== Instalando pacotes via $MANAGER ==="

    case "${MANAGER}" in
    'yay' | 'pacman')
        $MANAGER -Syu --noconfirm "${PACKAGES[@]}"
        ;;
    *)
        bash /tmp/scripts/imports.sh "${PACKAGES[@]}"
        ;;
    esac

    clear_cache "$MANAGER"

fi
