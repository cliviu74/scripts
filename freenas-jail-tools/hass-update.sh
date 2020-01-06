#!/bin/tcsh

echo "Checking HomeAssistant updates"
pip3 list --outdated | grep homeassistant

if ( $? == 0 ) then
    echo "HomeAssistant update available"
    pip3 install --upgrade homeassistant
    echo "Stopping HomeAssistant"
    service hass stop
    echo "Vacuum sqlite3 database"
    sqlite3 /usr/local/etc/home-assistant/home-assistant_v2.db "VACUUM;"
    echo "Starting HomeAssistant"
    service hass start
else
   echo "No update available for HomeAssistant. Exitting..."
   exit 0
endif
