FROM debian:trixie

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        wget \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

ARG CTAN_MIRROR=https://mirror.ctan.org/systems/texlive/tlnet
RUN wget -r -np -nH --cut-dirs=3 -R "index.html*" ${CTAN_MIRROR}/ -P /tmp/tlnet
