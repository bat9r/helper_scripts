
if [ $(whoami) = "root" ]
then
	sudo apt-get update
	echo "Y" | sudo apt-get install apache2
	sudo systemctl start apache2
	echo "Y" | sudo apt-get install mysql-server mysql-client
	echo "Y" sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql
else
	echo "Try sudo $(basename $0)"
fi
