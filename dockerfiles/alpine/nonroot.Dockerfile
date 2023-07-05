ARG ALPINE_VERSION=latest

FROM alpine:${ALPINE_VERSION}

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
RUN apk add --no-cache \
        build-base \
        curl \
        git \
        perl-dev \
        openssh-client \
        sudo \
        texlive-full \
        zsh
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

# Create non-root user
ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-nonroot.sh ${USERNAME} \
    && /tmp/script-library/alpine-ohmyzsh.sh ${USERNAME} ${USE_OMZ} \
    && rm -r /tmp/script-library

USER ${USERNAME}

CMD [ "sleep", "infinity" ]
