ARG UBUNTU_VERSION=latest

FROM ubuntu:${UBUNTU_VERSION}

# Install libraries
USER root
ENV LANGUAGE=C.UTF-8
ENV LC_ALL=C.UTF-8
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        git \
        ssh-client \
        sudo \
        texlive-full \
        zsh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*
RUN yes | cpan install \
        File::HomeDir \
        Log::Dispatch::File \
        YAML::Tiny

# Create non-root user
ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-nonroot.sh ${USERNAME} ${USE_OMZ} && rm -r /tmp/script-library

USER ${USERNAME}

CMD [ "sleep", "infinity" ]