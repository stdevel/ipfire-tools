#!/bin/sh
#show help
if [ "$1" == "" ] || [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
	echo "USAGE:	traf.sh interface metric"
	echo ""
	echo "		interface	=> network interface (e.g. green0)"
	echo "		metric		=> 'down' for download, 'up' for upload"
	echo ""
	echo "EXAMPLES:"
	echo "	traf.sh green0 up"
	echo "	traf.sh red0 down"
	echo ""
	exit 0
fi

#abort if no interface or metric given
if [ "$1" == "" ] || [ "$2" == "" ] ; then echo "(empty)";exit 1; fi

#print metric
if [ "$2" == "up" ]; then
	traf_total="$(vnstat -i $1 -m --oneline|grep `date +'%y'`|grep `date +'%b'`|cut -d';' -f10)"
else
	traf_total="$(vnstat -i $1 -m --oneline|grep `date +'%y'`|grep `date +'%b'`|cut -d';' -f9)"
fi
echo $traf_total
