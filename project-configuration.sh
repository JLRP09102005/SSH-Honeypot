#!/bin/bash

## VARIABLES
datetime="$(date "+%Y%m%d_%H%M%S")"

## SOURCES
source "configuration.conf"
source "${MODULES_FOLDER_PATH}/dependences.sh"
source "${MODULES_FOLDER_PATH}/logs.sh"
source "${MODULES_FOLDER_PATH}/interface.sh"

## FUNCTIONS
create_bait_user()
{
    local hashed_passwd
    hashed_passwd="$(openssl passwd -6 "$DEFAULT_PASSWD")"
    sudo useradd -M -s "/bin/false" -u "2000" -p "$hashed_passwd" admin
}

## INIT
log_init "$datetime"

## MAIN SCRIPT
log_info "Started ssh honeypot project configuration"
check_dependences || exit
log_info "Creating bait user called admin"
