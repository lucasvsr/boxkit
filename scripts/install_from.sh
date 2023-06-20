#! /usr/bin/env bash

MANAGER=$1

if [ "$(yq -e ".\"$MANAGER\"[]" /tmp/packages.json)" ]; then

    mapfile -t PACKAGES < <(yq -r ".\"$MANAGER\"[]" < /tmp/packages.json)

fi

if command -v "$MANAGER" > /dev/null
then

    $MANAGER -Syu --noconfirm "${PACKAGES[@]}"

fi
