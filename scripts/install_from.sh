#! /usr/bin/env bash

MANAGER=$1
mapfile -t PACKAGES < <(yq -r ".\"$MANAGER\"[]" < /tmp/packages.json)

if command -v "$MANAGER" > /dev/null && [ ${#PACKAGES[@]} -gt 0 ]
then

    $MANAGER -Syu --noconfirm "${PACKAGES[@]}"

fi
