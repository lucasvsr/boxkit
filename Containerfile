FROM ghcr.io/ublue-os/arch-distrobox

LABEL com.github.containers.toolbox="true" \
  usage="This image is meant to be used with the toolbox or distrobox command" \
  summary="A cloud-native terminal experience" \
  maintainer="lucasvsribeiro@outlook.com"

ENV BUILDER "builder"

COPY --from=docker.io/mikefarah/yq /usr/bin/yq /usr/bin/yq
COPY scripts /tmp/scripts

ADD conf.yml /tmp/conf.yml

RUN chmod 777 /tmp/scripts/*.sh && \
    mkdir -p /etc/sudoers.d && \
    useradd --system --create-home ${BUILDER} && echo "$BUILDER ALL=(ALL:ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/${BUILDER}

RUN /tmp/scripts/chaotic-aur.sh

COPY etc /etc

RUN /tmp/scripts/install_from.sh pacman
RUN /tmp/scripts/install_from.sh host

USER ${BUILDER}
WORKDIR /home/${BUILDER}

RUN /tmp/scripts/install_from.sh yay

USER root
WORKDIR /

RUN echo "LANG=pt_BR.UTF-8" > /etc/locale.conf && \
    echo "pt_BR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen

ENV LANG "pt_BR.UTF-8"
ENV LC_ALL "pt_BR.UTF-8"

RUN userdel -r -f ${BUILDER} && \
    rm -rf /home/${BUILDER} && \
    sed -i '/${BUILDER} ALL=(ALL) NOPASSWD: ALL/d' /etc/sudoers && \
    rm -rf \
        /tmp/* \
        /var/cache/pacman/pkg/* && \
    unset BUILDER