#!/bin/bash
if [ $(whoami) = "root" ]
then
	if [ -f /etc/debian_version ]
	then
		sudo apt-get update
		echo "Y" | sudo apt-get install apache2
		sudo systemctl start apache2
		echo "Y" | sudo apt-get install mysql-server mysql-client
		echo "Y" | sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
	elif [ -f /etc/redhat-release ]
	then
		echo "Y" | sudo yum update
		echo "Y" | sudo yum install httpd
		sudo service httpd start
		echo "Y" | sudo yum install mysql mysql-server
		sudo mysql_secure_installation
		sudo service mariadb start
		echo "Y" | sudo yum install php php-mysqlnd
	fi
else
	echo "Try sudo $(basename $0)"
fi
