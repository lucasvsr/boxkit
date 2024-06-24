FROM ghcr.io/ublue-os/arch-distrobox

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A cloud-native terminal experience" \
  maintainer="lucasvsribeiro@outlook.com"

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq
COPY scripts /tmp/scripts

ADD conf.yml /tmp/conf.yml

RUN chmod 777 /tmp/scripts/*.sh && \
    mkdir -p /etc/sudoers.d && \
    useradd --system --create-home dbox_builder && echo "dbox_builder ALL=(ALL:ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/dbox_builder

RUN /tmp/scripts/chaotic-aur.sh

COPY etc /etc

RUN /tmp/scripts/install_from.sh pacman
RUN /tmp/scripts/install_from.sh host

USER dbox_builder
WORKDIR /home/dbox_builder

RUN /tmp/scripts/install_from.sh paru

USER root
WORKDIR /

RUN echo "LANG=pt_BR.UTF-8" > /etc/locale.conf && \
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ENV LANG "pt_BR.UTF-8"
ENV LC_ALL "pt_BR.UTF-8"

RUN userdel -r -f dbox_builder && \
    rm -rf /home/dbox_builder && \
    sed -i '/dbox_builder ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/*