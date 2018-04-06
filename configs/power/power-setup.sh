#!/bin/sh

# Crunkbong power management
# Unlike literally most Linux distros, crunkbong uses no centralized power
# manager.  Instead, it uses the same utilities directly, just like
# other projects' power management does. This is to encourage users to
# actually understand the infrastructures they use.

# Setting 00lock and lid.sh as executable
chmod +x ./00lock ./lid.sh
# Get power dependencies
apt-get install pm acpid suckless-tools
# Set-up folders in case they weren't with install
mkdir -p /etc/pm/sleep.d /etc/acpi/events

# Move the configurations to their proper homes
cp ./00lock /etc/pm/sleep.d
cp ./lid.sh /etc/acpi
cp ./lid /etc/acpi/events

exit 0
