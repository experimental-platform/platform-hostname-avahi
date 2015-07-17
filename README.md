# CURRENTLY DEFECT

## This service curently bails with a strange error message:

    $ docker run -ti --name=test123  --rm --net=host dockerregistry.protorz.net/hostname-avahi:latest avahi-daemon --no-drop-root --debug
    avahi-daemon 0.6.31 starting up.
    No service file found in /etc/avahi/services.
    netlink.c: bind(): Address already in use
    avahi-daemon: starting up: iface-linux.c:380: avahi_interface_monitor_sync: Assertion `m' failed.

Committed anyhow as module testing is supposed to catch the bug. 

## FIX: It's a rece condition, just add a little bit of sleep to fix it m(