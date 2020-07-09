# Home Assistant maintenance scripts


## Home Assistant installation on FreeNAS / TrueNAS jail

First, you need to create a freenas jail. nixCraft blog has a good tutorial on creating jails on freenas https://www.cyberciti.biz/faq/how-to-create-freenas-jails-with-iocage/

Attach to the jail with the iocage console.

``` shell
iocage console hass << replace this with your freenas jail name 
```

In the jail console, run the following

```
pkg -y install curl
curl https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/homeassistant-install-freenas.csh | csh
```

## To update Home Assistant on a freenas jail


To run the update you can either installl the script in the jail and run it locally, or use the one line method by hitting the most updated version from this github repo.

## Install the script locally

Attach to the jail with the iocage console command 

``` shell
iocage console hass << replace this with your freenas jail name 
```

Run the following to install the update script

``` shell
curl -o /usr/local/bin/hass-update.csh https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/hass-update.csh
chmod +x /usr/local/bin/hass-update.csh
ln -s /usr/local/bin/hass-update.csh /usr/local/bin/hass-update
```

Run the update

```shell
/usr/local/bin/hass-update
```

## One line update
Attach to the jail with the iocage console command 

``` shell
iocage console hass << replace this with your freenas jail name 
```

Run the following in the jail console

```shell
curl https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/hass-update.csh | csh
```
## Disclaimer
Please run the scripts on your own risk. While I am using this scripts on regular basis to update my Home Assistant freenas jail, the script may not work on all environments. Please backup before running the scripts. 

## Reporting bugs
If you have any problems running these scripts, please report them by opening an issue in this repository - https://github.com/cliviu74/scripts/issues

## Credits

Home Assistant - https://www.home-assistant.io/

FreeNAS - https://www.freenas.org/

The original Home Assistant installation/upgrade: https://www.home-assistant.io/docs/installation/freenas/
