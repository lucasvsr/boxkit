#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".packages.\"$MANAGER\"[]" </tmp/conf.yml)

if command -v "$MANAGER" >/dev/null && [ ${#PACKAGES[@]} -gt 0 ]; then

    echo "=== Instalando pacotes via $MANAGER ==="
    
    $MANAGER -Syu --noconfirm "${PACKAGES[@]}"

    echo "=== Limpando cache ==="

    case "${MANAGER}" in
    'yay')
        $MANAGER -Yc --noconfirm
        ;;

    *)
        $MANAGER -Scc --noconfirm
        ;;
    esac

fi
