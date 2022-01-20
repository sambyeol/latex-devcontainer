ARG UBUNTU_VERSION=latest

FROM ubuntu:${UBUNTU_VERSION}

ARG USERNAME=sambyeol
ARG DEBIAN_FRONTEND=noninteractive

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        curl \
        git \
        ssh-client \
        sudo \
        texlive-full \
        zsh \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/*

RUN useradd \
        --shell $(which zsh) \
        -G sudo \
        -m -d /home/${USERNAME} -k /etc/skel \
        ${USERNAME} \
    && sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers \
    && touch /home/${USERNAME}/.sudo_as_admin_successful

USER ${USERNAME}
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && sed -i -e 's/ZSH_THEME=.*/ZSH_THEME="simple"/g' ~/.zshrc

CMD [ "sleep", "infinity" ]