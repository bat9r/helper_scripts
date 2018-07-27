#!/bin/bash
#test
if [ -f /etc/debian_version ]
then
	if ! pidof apache2 > /dev/null
	then
	   sudo service apache2 restart
	else
	   echo "All is well"
	fi
elif [ -f /etc/redhat-release ]
then
	if ! pidof httpd > /dev/null
	then
	   sudo service httpd restart
	else
	   echo "All is well"
	fi
fi
	

