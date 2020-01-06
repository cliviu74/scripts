# Freenas jail console

This is a simple tool that will open a console to a FreeNAS iocage jail using ssh

## Installation

Run install.sh 

## Before using

This script defaults to connecting to mDNS record offered by freenas under freenas.local. If needed, edit the script at /usr/local/bin/freenas-console.sh and replace the value of FREENAS_HOST with your hostname
This script assumes the passwordless SSH authentication with the freenas box has been set-up and it is using the root user

## Usage

```
freenas-console jail_name
```
