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

CMD [ "sleep", "infinity" ]
