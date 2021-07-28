#!/bin/bash
#add fix to exercise1 here
apt install net-tools
route del -net www.textfiles.com gw 0.0.0.0 netmask 255.255.255.255
