FROM base

ARG USE_OMZ=true
COPY script-library/alpine-*.sh /tmp/script-library/
RUN /tmp/script-library/alpine-ohmyzsh.sh root ${USE_OMZ} \
    && rm -r /tmp/script-library

USER root

CMD [ "sleep", "infinity" ]
