#!/usr/bin/env ash

USERNAME=${1:-"root"}

if [ "$(id -u)" -ne 0 ]; then
    echo -e "Script must be run as root."
    exit 1
fi

# Create non-root user
if ! [ "${USERNAME}" = "root" ]; then
    adduser --disabled-password --shell $(which zsh) ${USERNAME}
    echo "${USERNAME} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${USERNAME}
    chmod 0440 /etc/sudoers.d/${USERNAME}
    sed -i -e 's/%sudo.*/%sudo\tALL=(ALL:ALL)\tNOPASSWD:ALL/g' /etc/sudoers
    su ${USERNAME} -s /bin/sh -c "touch /home/${USERNAME}/.sudo_as_admin_successful"
fi
