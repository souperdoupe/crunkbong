#!/bin/sh

# Proprietary firmware directory
pfdir="/tmp/debs"
# Firmware list
firm="/tmp/firmware.txt"
# Function to trim the fat off .deb listings
trim(){
sed 's/ - .*//g'
}

if [ -f $firm ]; then rm $firm; fi
apt-cache search wireless | grep firmware | trim >> $firm
apt-cache search b43 | trim >> $firm
cd $pfdir

# Loop through each hit with the keyword wireless and firmware
for i in $(cat $firm); do
# Make sure it doesn't already exist
if [ ! $(ls | grep "$i") ]; then
# If it isn't already there, then download it
apt-get download $i;
# Cleanup
fi
done

rm /tmp/firmware.txt
