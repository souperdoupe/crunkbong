#!/bin/sh

# If you want to call any other X11 apps from this script,
# uncomment the following lines, and throw-in whatever apps you
# want using the following function, titled "run"
#export DISPLAY=":0"
#run(){ su -c "$1" crunkbong; }

if [ "$3" = "close" ]; then
	# For more info, check out the hooks in /etc/pm/sleep.d
	/usr/sbin/pm-suspend
fi
