#!/bin/bash

# This program converts the comics/mangas into a Kindle 
# supported format (pdf)

# Include C style dependency inclusion
. $(dirname "$0")/src/include.sh

# Dependency inclusions

if [[ $__PROMPT_SH -eq "" ]]; then
include 'src/colors/prompt.sh'
fi

if [[ $__RUN_AS_ROOT -eq "" ]]; then
include 'src/run_as_root.sh'
fi

# Source header definition
if [[ $__CBZTOPDF -eq "" ]]; then
__CBZTOPDF=1
fi


# This program must be run as a root. So obviously, we need to
# check whether the current user is root. If not, let's ask for the 
# password.

run_as_root


DEFAULT="${PWD}"