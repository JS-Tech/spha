#!/bin/bash

sudo -u spha ssh $1@146.185.163.64 -p $2 -o ConnectTimeout=10 -o PasswordAuthentication=false -o BatchMode=yes "cd /var/www/romont.eebulle.ch/public_html/eebulle.romont/ && git pull"
