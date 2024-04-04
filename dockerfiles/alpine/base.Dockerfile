FROM alpine:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
RUN apk add --no-cache \
        build-base \
        ca-certificates \
        curl \
        git \
        perl-dev \
        openssh-client \
        zsh
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

ARG LATEX_VERSION
ARG CTAN_MIRROR=https://mirror.ctan.org/systems/texlive/tlnet
RUN cd /tmp \
    && curl -kL ${CTAN_MIRROR}/install-tl-unx.tar.gz | tar -xzf - \
    && cd ./install-tl-* \
    && perl ./install-tl --no-interaction --location ${CTAN_MIRROR} \
    && ls -l /usr/local/texlive/${LATEX_VERSION}/bin/${TARGETARCH/amd/x86_}-${TARGETOS} \
    && rm -r /tmp/*

ENV PATH="/usr/local/texlive/${LATEX_VERSION}/bin/${TARGETARCH/amd/x86_}-${TARGETOS}:${PATH}"

CMD [ "sleep", "infinity" ]
