#! /usr/bin/env bash

git clone https://github.com/KyleGospo/xdg-utils-distrobox-arch.git --single-branch
cd xdg-utils-distrobox-arch/trunk
makepkg -si --noconfirm --force
