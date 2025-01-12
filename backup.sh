#!/bin/bash

DATE=$(date +"%d-%b-%Y")
cd /media/storage
tar -zcvf data-$DATE.tgz appdata
mv *.tgz /home/pi/data-backup
