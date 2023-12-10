#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".packages.\"$MANAGER\"[]" < /tmp/conf.yml)

if command -v "$MANAGER" > /dev/null && [ ${#PACKAGES[@]} -gt 0 ]
then

    $MANAGER -Syu --noconfirm "${PACKAGES[@]}"

    if [ "$MANAGER" == 'yay' ]; then

        $MANAGER -Yc --noconfirm

    elif [ "$MANAGER" == 'pacman' ]; then

        $MANAGER -Scc --noconfirm
        
    fi

fi
