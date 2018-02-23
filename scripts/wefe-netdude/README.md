# WeFe - network dude
wefe is a minimalist network assisstant.  I cannot, in good consciensce, call this 
a network "manager," as much of the automation and GUI benefits of modern network 
managers don't apply, and there is only a small chance that I will add those 
(if I get bored).  Nonetheless, its purpose is to offer a simplified solution to 
connecting to new and saved networks.  
This project is inspired by ceni and the freebsd wifi manager.


wefe will create a file for a sepcific network using a specified interface and essid+bssid; 
this file will then be copied to /etc/network/interfaces.d/$interface.cfg. 
By editing /etc/network/interfaces directly (rather than going through a traditional network manager), 
you can fine-tune small but meaningful parameters that normal network managers ignore.  You can also 
modify the script to suit your needs, rather easily.  Additional reading on managing interfaces can be 
found through Google searching and manpages (ie, man interfaces).

# Rationale
The tradeoff with popular wifi managers that one often inhibits
modularity.  There are two scripts, which both achieve a fundamental goal, but
do so in different ways (both have their own installer, too):


wefe-if: uses network/interfaces directly.  This script aims to deliver the similar core functionality
while also giving the user control for individualized modularity.  I also wrote
this to serve as a rough precursor to an openbsd variant.


wefe-sup: uses wpa_supplicant.  Fundamentally the same as the former, but accomplishes 
its goal using wpa_supplicant directly.


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

-i : modify the currently-used wefe.cfg to use a new network interface (and restart networking)

WIP
-u : connect to an unencrypted (open) network.  Must specify an essid/bssid.
