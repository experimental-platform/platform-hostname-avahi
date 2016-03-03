#!/usr/bin/env bash

set -eu

INTERFACES=$(ip link | sed -r 's/^[0-9]*: ([a-z0-9]*).*/\1/;tx;d;:x' | grep -v '^veth' | grep -v '^docker' | grep -v '^lo$' | tr '\n' ',' | sed 's/,$//')
BLACKLIST_INTERFACES=$(ip link | sed -r 's/^[0-9]*: ([a-z0-9]*).*/\1/;tx;d;:x' | grep '^veth' | tr '\n' ',' | sed 's/,$//')

cp /etc/avahi/avahi-daemon.conf /etc/avahi/avahi-daemon.conf.bak

sed "s|#allow-interfaces=.*|allow-interfaces=$INTERFACES|" -i /etc/avahi/avahi-daemon.conf
#sed "s|deny-interfaces=.*|deny-interfaces=$BLACKLIST_INTERFACES|" -i /etc/avahi/avahi-daemon.conf

avahi-daemon
