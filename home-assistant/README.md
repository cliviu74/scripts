# Home Assistant maintenance scripts


## Home Assistant update script for freenas jail hass-update.csh
Following the updating instructions from the official home assistant documentation can be quite prone to errors. I've written this small script to ensure the update process is consistent.
The official home assistant installation/upgrade instructions for Freenas can be found here: https://www.home-assistant.io/docs/installation/freenas/

## Installation

You can attach to the jail with the iocage console command 

``` shell
iocage console hass << replace this with your freenas jail name 
```

Run the following commands in the Home Assistant freenas jail

``` shell
curl -o /usr/local/bin/hass-update.csh https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/hass-update.csh
chmod +x /usr/local/bin/hass-update.csh
ln -s /usr/local/bin/hass-update.csh /usr/local/bin/hass-update
```
