# boxkit: meu container para uso no Fedora Silverblue

[![build-boxkit](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml/badge.svg)](https://github.com/lucasvsr/boxkit/actions/workflows/build-boxkit.yml)

Seguindo a recomendação do time do Fedora Silverblue, uso um container para instalação de ferramentas CLI e algumas aplicações desktop.

## Aplicações instaladas nesta imagem

As aplicações embarcadas nesta imagem podem ser vistas no arquivo `conf.yml` agrupadas pelo gestor que irá instalá-las.

## Como usar

### Usando o distrobox (recomendado)

```console
distrobox create -i ghcr.io/lucasvsr/boxkit -n boxkit # É recomendado o uso com o Fish Shell. Leia mais abaixo.
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

O container tem os três shells mais famosos: bash, zsh e fish. Para trocar o shell padrão, basta entrar no container e usar o comando abaixo:

```console
chsh -s /bin/<SHELL> $USER
```

Após a execução deste comando reinicie seu terminal e verá que o novo shell será iniciado.

Dependendo da ferramenta de terminal usada, é possível fazer esta configuração de forma gráfica e sem a necessidade de reiniciar o container.

É recomendado o uso com o `fish` visto que ele tem uma integração maior com alguns dos pacotes pré-instalados no container, como o atuin e o starship. Caso queira usar o `zsh`, será necessário utilizar a flag `--login` para ter maior integração com as ferramentas instaladas no container. Do contrário, será necessário configurar o `~/.zshrc` para carregar as ferramentas instaladas no container.

Não é recomendado o uso do bash devido àlgumas incompatibilidades com as ferramentas instaladas no container.

### Dotfiles (chezmoi)

O chezmoi é um utilitário para checkout e aplicação de dotfiles que estão em um repositório git. O uso dele é recomendado. 

Caso já use, faça o checkout dos seus dotfiles com o seguinte comando:

```console
chezmoi init <USER_GIT> --apply
```

### Git (gh e glab)

Este container já possui os github-cli (gh) e gitlab-cli (glab). Basta realizar login em algum dos serviços com os seus respectivos utilitários.

### AUR (paru)

O utilitário para instalação de pacotes do AUR neste container é o paru. Lembrando que é sempre recomendado uma leitura dos scripts oriundos do AUR.
