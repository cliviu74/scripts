#!/bin/sh

echo "Installing script to /usrl/local/bin/"
curl https://raw.githubusercontent.com/cliviu74/scripts/master/freenas-console/freenas-console.sh -o /usr/local/bin/freenas-console.sh
#cp freenas-console.sh /usr/local/bin
chmod +x /usr/local/bin/freenas-console.sh
ln -s /usr/local/bin/freenas-console.sh /usr/local/bin/freenas-console
