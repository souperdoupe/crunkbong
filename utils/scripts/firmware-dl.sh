#!/bin/sh

# Lousy download automation for proprietary firmware .debs

# In theory, this script could be used to batch-download any
# set of .debs; however, I'm keeping it focused on this very
# specific purpose for the time being.

# Proprietary firmware directory
pfdir="/freya/crunkbong/0.7/home/crunkbong/wireless-firmware"
# Firmware list
firm="/tmp/firmware.list"
# Apt-cache search package names
# Will be grepped against the string "firmware"
pkglist="wireless b43 intelwimax bnx"

# Function to trim the fat off .deb listings
trim(){
sed 's/ - .*//g'
}

# Bleach the old firmware list
if [ -f $firm ]; then cat /dev/null > /tmp/firm; fi
# Aggregate a list of packages
# Should also write something to append version numbers
# so the next process can check for updated drivers.
# C'est la vie.
for i in $pkglist; do
	apt-cache search | grep firmware | trim >> $firm
done
# Enter the working directory
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
