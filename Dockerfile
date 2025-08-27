FROM debian:trixie

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
RUN export DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        ca-certificates \
        curl \
        git \
        libfile-homedir-perl \
        liblog-dispatch-perl \
        libyaml-tiny-perl \
        ssh-client \
        sudo \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

COPY --from=cache /tmp/tlnet /tmp/tlnet

ARG TARGETARCH TARGETOS
ARG PLATFORM=${TARGETARCH/amd/x86_}
ARG PLATFORM=${PLATFORM/arm/aarch}
ARG PLATFORM=${PLATFORM}-${TARGETOS}
RUN cd /tmp \
    && curl -kL https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz | tar -xzf - \
    && cd ./install-tl-* \
    && TEXLIVE_INSTALL_ENV_NOCHECK=1 perl ./install-tl --no-interaction -repository /tmp/tlnet -texdir /opt/texlive \
    && ls -l /opt/texlive/bin/${PLATFORM} \
    && rm -r /tmp/*

ENV MANPATH="/opt/texlive/texmf-dist/doc/man:${MANPATH}"
ENV INFOPATH="/opt/texlive/texmf-dist/doc/info:${INFOPATH}"
ENV PATH="/opt/texlive/bin/${PLATFORM}:${PATH}"

CMD [ "sleep", "infinity" ]
