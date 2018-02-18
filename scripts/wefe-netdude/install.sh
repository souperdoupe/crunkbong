#!/bin/sh

# Updates the default script's shell from ksh93 to sh
# If you're like me, and like/use ksh93, comment this line out.
# apt-get install ksh
sed 's/ksh93/sh/g' ./wefe

# Create the default configuration directory
mkdir /etc/wpa

# Move the wefe script to /usr/local/bin
cp ./wefe /usr/local/sbin

exit 0
