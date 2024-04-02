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

ARG LATEX_VERSION
RUN cd /tmp \
    && curl -L https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzf - \
    && cd ./install-tl-* \
    && perl ./install-tl --no-interaction \
    && ls -l /usr/local/texlive/${LATEX_VERSION}/bin/${TARGETARCH/amd/x86_}-${TARGETOS} \
    && rm -r /tmp/*

ENV PATH="/usr/local/texlive/${LATEX_VERSION}/bin/${TARGETARCH/amd/x86_}-${TARGETOS}:${PATH}"

CMD [ "sleep", "infinity" ]
