# Home Assistant maintenance scripts


## Home Assistant installation script for freenas jails - homeassistant-install-freenas.csh
You can attach to the jail with the iocage console command 

``` shell
iocage console hass << replace this with your freenas jail name 
```


```
pkg -y install curl
curl https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/homeassistant-install-freenas.csh | csh
```

## Home Assistant update script for freenas jail hass-update.csh

Following the updating instructions from the official home assistant documentation can be quite prone to errors. I've written this small script to ensure the update process is consistent.
The official home assistant installation/upgrade instructions for Freenas can be found here: https://www.home-assistant.io/docs/installation/freenas/

## Install the script 

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

Oneliner update 
```shell
curl -o /usr/local/bin/hass-update.csh https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/hass-update.csh | csh
```
## Disclaimer
Please run the scripts on your own risk. While I am using this scripts on regular basis to update my Home Assistant freenas jail, the script may not work on all environments. Please backup before running the scripts. If you find any issues, you can open an issue in this repository.

## Credits

Home Assistant - https://www.home-assistant.io/

FreeNAS - https://www.freenas.org/
