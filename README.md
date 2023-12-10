# boxkit: meu container para uso no Fedora Silverblue

[![build-boxkit](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml/badge.svg)](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml)

Seguindo a recomendação do time do Fedora Silverblue, uso um container para instalação de ferramentas CLI e algumas aplicações desktop.

## Aplicações instaladas nesta imagem

As aplicações embarcadas nesta imagem podem ser vistas no arquivo `conf.yml` agrupadas pelo gestor que irá instalá-las.

## Como usar

### Usando o distrobox (recomendado)

```console
distrobox create -i ghcr.io/lucasvsr/boxkit -n boxkit
distrobox enter boxkit
```

### Usando o toolbox

```console
toolbox create -i ghcr.io/lucasvsr/boxkit -c boxkit
toolbox enter boxkit
```

### Mais detalhes deste projeto

Este projeto basea-se no [boxkit](https://github.com/ublue-os/boxkit) da organização [uBlue](https://github.com/ublue-os).

## Dicas

### Shell

O container tem os três shells mais famosos: bash, zsh e fish. Para trocar o shell padrão basta criar um container informando a variável `$SHELL`:

```console
distrobox create -a "--env SHELL=/bin/<SHELL>" -i ghcr.io/lucasvsr/boxkit -n boxkit
```

### Dotfiles (chezmoi)

O chezmoi é um utilitário para checkout e aplicação de dotfiles que estão em um repositório git. O uso dele é recomendado. 

Caso já use, faça o checkout dos seus dotfiles com o seguinte comando:

```console
chezmoi init <USER_GIT> --apply
```

### Git (gh e glab)

Este container já possui os github-cli (gh) e gitlab-cli (glab). Basta realizar login em algum dos serviços com os seus respectivos utilitários.

### AUR (yay)

O utilitário para instalação de pacotes do AUR neste container é o yay. Lembrando que é sempre recomendado uma leitura dos scripts oriundos do AUR.
