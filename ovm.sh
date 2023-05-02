#!/bin/sh

if [ "$1" == "sync" ]; then
    shift

    # check if path supplied
    while getopts v: flag
    do
        case "${flag}" in
            v) vault=${OPTARG};;
        esac
    done

    # if path is not supplied, get default
    if [ -z "$vault" ]; then
        vault="$OVM_DEFAULT_VAULT"
    fi

    if [ -z "$vault" ]; then
        echo "No path provided and OVM_DEFAULT_VAULT is not set."
        exit 22
    fi

    # pull from remote, commit all local changes, push to remote
    git -C $vault pull -q
    git -C $vault add -A
    git -C $vault commit -m "ovm sync" -q
    git -C $vault push -q
fi

