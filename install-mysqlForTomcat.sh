#Install MySQL

mysql_user="tom"
mysql_password="cat"
first_db="test_oms_db"
second_db="product_oms_db"

echo "y" | sudo yum install mariadb mariadb-server
sudo systemctl enable mariadb
sudo systemctl start mariadb
mysql -u root -e "CREATE USER '$mysql_user'@'%' IDENTIFIED BY '$mysql_password';
                  GRANT ALL PRIVILEGES ON * . * TO '$mysql_user'@'%';
                  FLUSH PRIVILEGES;"
mysql -u $mysql_user -p${mysql_password} -e "create database $first_db;
                                             create database $second_db;"

sudo firewall-cmd --zone=public --add-port=3306/tcp
sudo firewall-cmd --zone=public --add-port=3306/tcp --permanent
