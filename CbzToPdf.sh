#!/bin/bash

# This program converts the comics/mangas into a Kindle 
# supported format (pdf)


# Include C style dependency inclusion
. $(dirname "$0")/src/include.sh

# Equivalent to #ifndef
if [[ $__PROMPT_SH -eq "" ]]; then
include 'src/colors/prompt.sh'
fi

# This program must be run as a root. So obviously, we need to
# check whether the current user is root. If not, let's ask for the 
# password. 

if [[ "$USER" != "root" ]]; then
    prompt -w "WARNING: This program has to be run by root.\n"
    prompt -i "Do you want to run this program as a root? [y/n]: "
    read RESPONSE

    case $RESPONSE in 
        "y" | "Y" | "yes" | "Yes") 
            prompt -i "Entering the program as root.\n"
            sudo ./CbzToPdf.sh
            exit 0
            ;;
        "n" | "N" | "no" | "No")
            prompt -s "Exitting the program.\n"
            exit 0
            ;;
        *)
            prompt -e "FATAL ERROR: Unknown answer. Exitting the program. \n"
            exit 1
            ;;
    esac
# Of course, we can take 

DEFAULT="${PWD}"