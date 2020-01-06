#!/bin/tcsh

portsnap fetch update
cd /usr/ports/multimedia/plexmediaserver-plexpass
make deinstall
make install clean
service plexmediaserver_plexpass restart
