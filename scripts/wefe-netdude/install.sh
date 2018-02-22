#!/bin/sh

# Check for root
if [ "$(id -u)" != 0 ]; then echo "Re-run as root.  Exiting..."; exit; fi

# Make sure values in interfaces.d will be loaded
# Add a stanza if not.
if [ ! "$(grep 'source /etc/network/interfaces.d/*' /etc/network/interfaces ]; then
echo "source /etc/network/interfaces.d/*" >> /etc/network/interfaces
fi && \

# Updates the default script's shell from ksh93 to sh
# If you're like me, and like/use ksh93, comment this line out.
# apt-get install ksh
sed -i 's/ksh93/bash/g' ./wefe && \

# Create the default configuration directory
if [ ! -d /etc/wpa ]; then mkdir /etc/wpa; fi && \

# Move the wefe script to /usr/local/bin
cp ./wefe /usr/local/bin && \

exit 0
