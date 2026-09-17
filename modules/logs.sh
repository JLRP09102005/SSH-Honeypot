#!/bin/bash

## VARIABLES
LOG_FILE=

## log_init DATE
log_init()
{
    [[ -z "$1" ]] && log_error "log_init[logs.sh] function requires a date as argument"
    LOG_FILE="${LOG_FOLDER_PATH}/$1.log"
}

## log_ok MESSAGE
log_ok()
{
    [[ -z "$1" ]] && echo "log_ok[logs.sh] function requires a message argument"
    
    printf "%b%s%b\n" "$GREEN" "$1" "$NC" | tee -a "$LOG_FILE"
}

## log_info MESSAGE
log_info()
{
    [[ -z "$1" ]] && echo "log_info[logs.sh] function requires a message argument"
    
    printf "%b%s%b\n" "$BLUE" "$1" "$NC"
}

## log_error MESSAGE
log_error()
{
    [[ -z "$1" ]] && echo "log_error[logs.sh] function requires a message argument"
    
    printf "%b%s%b\n" "$RED" "$1" "$NC" | tee -a "$LOG_FILE"
}

## log_warning MESSAGE
log_warning()
{
    [[ -z "$1" ]] && echo "log_warning[logs.sh] function requires a message argument"
    
    printf "%b%s%b\n" "$YELLOW" "$1" "$NC"
}