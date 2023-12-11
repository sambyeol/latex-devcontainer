FROM base

# Install libraries
USER root
RUN apk add --no-cache \
        sudo

# Create non-root user
ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-nonroot.sh ${USERNAME} \
    && /tmp/script-library/alpine-ohmyzsh.sh ${USERNAME} ${USE_OMZ} \
    && rm -r /tmp/script-library

USER ${USERNAME}

CMD [ "sleep", "infinity" ]
