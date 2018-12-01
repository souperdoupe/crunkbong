#!/bin/sh

# Check for root
if [ "$(id -u)" != 0 ]; then echo "Re-run as root.  Exiting..."; exit; fi

# Updates the default script's shell from ksh93 to sh
# If you're like me, and like/use ksh93, comment this line out.
# apt-get install ksh
sed -i 's/ksh93/bash/g' ./wefe-sup && \

# Create the default configuration directory
if [ ! -d /etc/wefe/wefe-sup ]; then mkdir -p /etc/wefe/"wefe-sup"; fi
chown root:staff /etc/wefe/wefe-sup
# Create the config file for extra options
if [ ! -f /etc/wefe/wefe-sup/exops ]; then touch /etc/wefe/"wefe-sup"/exops; fi
chown root:staff /etc/wefe/wefe-sup/exops

# Move the wefe script to /usr/local/bin
cp ./"wefe-sup" /usr/local/bin/wefe && \
chown root:staff /usr/local/bin/wefe && \

echo "Installation complete!  Make sure you're a member of the 'staff' group."

exit 0 2> ./install-sup.errors
