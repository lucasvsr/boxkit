#! /usr/bin/env bash

# Tell build process to exit if there are any errors.
set -oue pipefail

sudo pacman -Syu --noconfirm

git clone https://github.com/KyleGospo/xdg-utils-distrobox-arch.git --single-branch /tmp/xdg-utils-distrobox-arch
cd /tmp/xdg-utils-distrobox-arch/trunk
makepkg -si --noconfirm --force
