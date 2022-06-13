#!/bin/bash
file="MFBot_Konsole_x86_64"
if [ -f "$file" ]
then
    echo "$file found."
else
    echo "$file not found. Downloading now..."
    cd /
    wget https://www.mfbot.de/Download/latest/MFBot_Konsole_x86_64
    chmod a+x MFBot_Konsole_x86_64
    ln -sf /MFBot_Konsole_x86_64 /mfbot/MFBot_Konsole_x86_64
fi
cd /mfbot/
screen -A -m -d -S mfbot ./$file
while [ ! -f /mfbot/logs/General.log ] ;
do
      sleep 1
done
sleep 5
tail -f /mfbot/logs/*
