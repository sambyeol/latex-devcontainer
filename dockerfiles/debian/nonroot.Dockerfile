FROM base

ARG USERNAME=sambyeol
ARG USE_OMZ=true
COPY script-library/debian-*.sh /tmp/script-library/
RUN /tmp/script-library/debian-nonroot.sh ${USERNAME} \
    && /tmp/script-library/debian-ohmyzsh.sh ${USERNAME} ${USE_OMZ} \
    && rm -r /tmp/script-library

USER ${USERNAME}

CMD [ "sleep", "infinity" ]
