#!/bin/sh
{
pkg install -y curl nano ffmpeg pkgconf python310 py310-sqlite3 ca_root_nss libxslt mariadb104-client rust
pw groupadd -n homeassistant -g 8123
echo 'homeassistant:8123:8123::::::/bin/csh:' | adduser -f -

/usr/local/bin/python3.10 -m ensurepip
/usr/local/bin/pip3.10 install --upgrade pip virtualenv

# Workaround for pyAV installation issues with pkg-config in virtualenv
ln -s /usr/local/bin/pkgconf /bin/pkg-config

mkdir -p /usr/local/share/homeassistant
chown -R homeassistant:homeassistant /usr/local/share/homeassistant

su homeassistant -c '/bin/csh' << EOS

cd /usr/local/share/homeassistant
virtualenv -p python3.10 .
source ./bin/activate.csh
python3.10 -m ensurepip
pip3.10 install --upgrade pip mysqlclient homeassistant

# Run ensure_config startup script to create initial configuration
hass --script ensure_config

# Run check_config startup script to install initial dependencies 
hass --script check_config

deactivate
EOS

mkdir -p /usr/local/etc/rc.d/
curl -o /usr/local/etc/rc.d/homeassistant https://raw.githubusercontent.com/cliviu74/scripts/master/home-assistant/homeassistant
chmod +x /usr/local/etc/rc.d/homeassistant
ln -s /usr/local/etc/rc.d/homeassistant /usr/local/etc/rc.d/hass
sysrc homeassistant_enable="YES"
} 2>&1 | tee homeassistant-install.log