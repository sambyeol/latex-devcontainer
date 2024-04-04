FROM debian:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        ssh-client \
        sudo \
        zsh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

ARG CTAN_MIRROR=https://mirror.ctan.org/systems/texlive/tlnet
ARG PLATFORM=${TARGETARCH/amd/x86_}
ARG PLATFORM=${PLATFORM/arm/aarch}
ARG PLATFORM=${PLATFORM}-${TARGETOS}
RUN cd /tmp \
    && curl -kL ${CTAN_MIRROR}/install-tl-unx.tar.gz | tar -xzf - \
    && cd ./install-tl-* \
    && TEXLIVE_INSTALL_ENV_NOCHECK=1 perl ./install-tl --no-interaction --location ${CTAN_MIRROR} -texdir /opt/texlive \
    && ls -l /opt/texlive/bin/${PLATFORM} \
    && rm -r /tmp/*

ENV PATH="/opt/texlive/bin/${PLATFORM}:${PATH}"

CMD [ "sleep", "infinity" ]
