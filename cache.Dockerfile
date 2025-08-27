FROM debian:trixie

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        perl \
        tar \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ARG CTAN_MIRROR=https://mirror.ctan.org/systems/texlive/tlnet
RUN mkdir /tmp/tlnet \
    && cd /tmp/tlnet \
    && curl -kL ${CTAN_MIRROR}/install-tl-unx.tar.gz | tar -xzf - --strip-components=1 \
    && TEXLIVE_INSTALL_ENV_NOCHECK=1 perl ./install-tl --no-interaction --location ${CTAN_MIRROR} --profile /dev/null --only-download
