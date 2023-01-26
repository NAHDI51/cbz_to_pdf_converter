#!/bin/bash

# This source code verifies whether the program is run as root, or not.
# If the program is run as root, this function will ask for permission,
# whether you will run it as root or not.

# Include C style dependency inclusion
. $(dirname "$0")/src/include.sh

# Equivalent to #ifndef
if [[ $__PROMPT_SH -eq "" ]]; then
include 'src/colors/prompt.sh'
fi

# Source header definition
if [[ $__RUN_AS_ROOT -eq "" ]]; then
__RUN_AS_ROOT=1
fi

run_as_root()
{
    if [[ "$USER" != "root" ]]; then
        prompt -w "WARNING: This program has to be run by root.\n"
        prompt -i "Do you want to run this program as a root? [y/n]: "
        read RESPONSE

        case $RESPONSE in 
            "y" | "Y" | "yes" | "Yes") 
                prompt -i "Entering the program as root.\n"
                sudo "$0"
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

    fi 

}