#!/bin/bash

sudo -u spha ssh $SPHA_FRIBOURG_USER@146.185.163.64 -p $SPHA_JSPORT -o ConnectTimeout=10 -o PasswordAuthentication=false -o BatchMode=yes "cd /var/www/fribourg.eebulle.ch/public_html/eebulle.fribourg/ && git pull"
