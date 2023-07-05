#!/usr/bin/env bash

USERNAME=${1:-"root"}
USE_OMZ=${2:-"true"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e "Script must be run as root."
    exit 1
fi

# Install OMZ
if [ "${USE_OMZ}" = "true" ] ; then
    RUNZSH=no su ${USERNAME} -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    su ${USERNAME} -s /bin/sh -c 'sed -i -e "s/ZSH_THEME=.*/ZSH_THEME=\"gentoo\"/g" ~/.zshrc'
fi
