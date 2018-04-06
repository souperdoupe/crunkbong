#!/bin/sh

echo "Installing scripts..." && \
cp ./scripts/* /usr/local/bin && \
echo "Done."

# function will ensure that the script doesn't break until option 1 or 2
# has been seleected
wefe_type(){
read mgmt
echo "Select how wefe should manage wifi by default (/usr/local/bin/wefe): 
1: wpasupplicant (default)
2: network/interfaces"
case $mgmt in
	"1") 
		echo "Installing wefe-netdude/wefe-sup to /usr/local/bin/wefe..."
		sh ./wefe-netdude/wefe-sup ;;
	"2")
		echo "Installing wefe-netdude/wefe-if to /usr/local/bin/wefe..."
		sh ./wefe-netdude/wefe-if ;;
	*) echo "Invalid option." && wefe_type ;;
esac
}

exit 0
