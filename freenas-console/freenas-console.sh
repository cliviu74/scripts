#!/bin/sh

FREENAS_HOST='freenas.local'
SSH_USER='root'

function usage(){
    echo "Usage: $0 jail_name"
    exit 1 
}

if [ "$#" -ne 1 ]; then
    usage
fi
ssh -l$SSH_USER $FREENAS_HOST -t "iocage console $1"