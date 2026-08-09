#!/bin/bash

check_dependences()
{
    sshd -V &>/dev/null || sudo apt install openssh-server &>/dev/null && log_ok "Installed ssh server" || log_error "Failed to load/install ssh server"
}