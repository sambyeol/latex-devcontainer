FROM alpine:latest

LABEL org.opencontainers.image.source=https://github.com/sambyeol/latex-devcontainer

# Install libraries
USER root
RUN apk add --no-cache \
        build-base \
        curl \
        git \
        perl-dev \
        openssh-client \
        texlive-full \
        zsh
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

CMD [ "sleep", "infinity" ]
