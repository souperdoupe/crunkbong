# WeFe - network dude
wefe is a minimalist network assisstant.  I cannot, in good consciensce, really call this a network "manager," as much of the automation and GUI
benefits of modern network managers don't really apply (yet).  Nonetheless, its purpose is to offer a simplified solution to connecting to new
networks.  This project is inspired by ceni and the freebsd wifi manager.


wefe -a will create a file for a sepcific network using a specified interface and essid+bssid; this file will then be copied to /etc/network/interfaces.d/$interface.cfg. 
By editing /etc/network/interfaces directly, you can further modify functionality, and modify the script to suit your needs, rather easily.  Additional
reading on managing interfaces can be found through Google searching and man interfaces.

# Rationale
The tradeoff with popular wifi managers that one often inhibits
modularity.  This script aims to deliver the similar core functionality
while also giving the user control for individualized modularity.  I also wrote
this to serve as a rough precursor to an openbsd variant.


The only real caveat is that it will not automatically connect to another
hotspot. Personally, I don't like when network managers do that.  However,
it would also be trivial to add functionality that did that for you (eg,
writing a daemon or something)


Supports on-the-fly cli data, along with some rough saving mechanisms.
In the future, I'd like to add gritty support for openvpn and macchanger.
For now, though, this can easily function as the middle-man script (eg, have a "meta-script" that chains macchanger or whatever)
# usage
You must declare one of these options:

-a : add a new network and connect.  You MUST specify an essid and bssid (wefe -s will populate a list).

-c : connect to an existing network, whose file is saved in /etc/wpa

-l : list saved networks

-s : scan for bssid/essid in the area

WIP
-u : connect to an unencrypted (open) network.  Must specify an essid/bssid.
