#!/usr/bin/env bash

set -oue pipefail

CONFIGURATIONS_FILE=/tmp/conf.yml
BASH_CONF_DIR=/etc/profile.d
FISH_CONF_DIR=/etc/fish/conf.d/

readarray CONFS < <(yq -o=j -I=0 '.configurations[]' "$CONFIGURATIONS_FILE")

apply_conf_fish() {

    local PACKAGE="$1"
    local COMMAND=$(echo "$2" | yq '.command.fish')
    local CONF_FILE=$FISH_CONF_DIR/"$PACKAGE.fish"

    if [[ -n "${COMMAND}" ]]; then

        echo "=== Aplicando configurações do $PACKAGE para o fish ==="
        echo "$COMMAND" >"$CONF_FILE"
        echo "Criado o arquivo $CONF_FILE"

    fi

}

apply_conf_posix() {

    local PACKAGE="$1"
    local COMMAND=$(echo "$2" | yq '.command.posix')
    local CONF_FILE="$BASH_CONF_DIR/_$PACKAGE"

    if [[ -n "${COMMAND}" ]]; then

        echo "=== Aplicando configurações do $PACKAGE para shells posix (bash/zsh) ==="
        eecho "$COMMAND" >"$CONF_FILE"
        echo "Criado o arquivo $CONF_FILE"

    fi

}

apply_conf() {

    local CONF="$1"
    local PACKAGE=$(echo "$CONF" | yq '.package')

    if [[ "$PACKAGE" != "null" ]]; then

        apply_conf_posix "$PACKAGE" "$CONF"
        apply_conf_fish "$PACKAGE" "$CONF"

    fi

}

mkdir -p $BASH_CONF_DIR
mkdir -p $FISH_CONF_DIR

if [[ ${#CONFS[@]} -gt 0 ]]; then

    for CONF in "${CONFS[@]}"; do

        apply_conf "$CONF"

    done

fi
