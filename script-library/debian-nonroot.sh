#!/usr/bin/env bash

USERNAME=${1:-"root"}
USE_OMZ=${2:-"true"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e "Script must be run as root."
    exit 1
fi

# Create non-root user
if ! [ "${USERNAME}" = "root" ]; then
    useradd --shell $(which zsh) -G sudo -m -d /home/${USERNAME} -k /etc/skel ${USERNAME}
    sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers
    su ${USERNAME} -s /bin/sh -c "touch /home/${USERNAME}/.sudo_as_admin_successful"
fi

# Install OMZ
if [ "${USE_OMZ}" = "true" ] ; then
    RUNZSH=no su ${USERNAME} -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    su ${USERNAME} -s /bin/sh -c 'sed -i -e "s/ZSH_THEME=.*/ZSH_THEME=\"simple\"/g" ~/.zshrc'
fi
