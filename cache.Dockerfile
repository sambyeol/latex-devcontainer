FROM debian:trixie

RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        rsync \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN rsync -az --info=progress2 rsync://mirror.ctan.org/CTAN/systems/texlive/tlnet/ /tmp/tlnet
