# boxkit: meu container para uso no Fedora Silverblue

[![build-boxkit](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml/badge.svg)](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml)


Seguindo a recomendação do time do Fedora Silverblue, uso um container para instalação de ferramentas CLI e algumas aplicações desktop.

## Aplicações instaladas nesta imagem

As aplicações embarcadas nesta imagem podem ser vistas no arquivo `packages.json` agrupadas pelo gestor que irá instalá-las.

## Como usar

### Usando o distrobox (recomendado)

    distrobox create -i ghcr.io/lucasvsr/boxkit -n boxkit
    distrobox enter boxkit

### Usando o toolbx (recomendado)

    toolbox create -i ghcr.io/lucasvsr/boxkit -c boxkit
    toolbox enter boxkit

### Mais detalhes deste projeto

Este projeto basea-se no [boxkit](https://github.com/ublue-os/boxkit) da organização [uBlue](https://github.com/ublue-os).