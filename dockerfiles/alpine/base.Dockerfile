FROM alpine:3.21

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
ARG TL_VERSION=
RUN apk add --no-cache \
        build-base \
        curl \
        git \
        perl-dev \
        openssh-client \
        texlive-full=${TL_VERSION} \
        zsh
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

CMD [ "sleep", "infinity" ]