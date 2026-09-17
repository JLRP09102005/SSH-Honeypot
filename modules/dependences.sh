#!/bin/bash

check_dependences()
{
    if [[ "$USER" != 0 || $(id -u) != 0 ]]; then return 1; fi

    sshd -V &>/dev/null || sudo apt install openssh-server -y &>/dev/null && log_ok "Installed ssh server" || log_error "Failed to load/install ssh server" && return 1
    openssl --version &> /dev/null 
}