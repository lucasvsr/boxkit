FROM quay.io/toolbx-images/archlinux-toolbox

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A cloud-native terminal experience" \
  maintainer="lucasvsribeiro@outlook.com"

ENV YAY_USER="yay"

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq
COPY --from=docker.io/testcab/yay /usr/bin/yay /usr/bin/yay
COPY scripts /tmp/scripts

ADD packages.json /tmp/packages.json

RUN chmod 777 /tmp/scripts/*.sh
RUN mkdir -p /etc/sudoers.d

RUN useradd --system --create-home $YAY_USER && echo "$YAY_USER ALL=(ALL:ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/$YAY_USER

RUN /tmp/scripts/chaotic-aur.sh

COPY etc /etc

RUN /tmp/scripts/build.sh pacman

USER ${YAY_USER}

WORKDIR /home/${YAY_USER}

RUN /tmp/scripts/build.sh yay
RUN /tmp/scripts/xdg-utils.sh

USER root

RUN userdel -r -f ${YAY_USER}

WORKDIR /

RUN rm -rf /home/${YAY_USER}

RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/docker
RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/flatpak
RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/rpm-ostree
RUN ln -fs /usr/bin/distrobox-host-exec /usr/local/bin/transactional-update