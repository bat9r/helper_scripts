#!/bin/bash
user=$1
password=$2
db_name="user_data"
RESULT='mysql -u $user -p$password -e "SHOW DATABASES" | grep -Fo $db_name'
if [ "$RESULT" = "$db_name" ]
then
    echo "Database exist"
else
    mysql -u $user -p${password} -e "create database $db_name"
    mysql -u $user -p${password} -e "use $db_name; 
									 create table users (
									 	id int not null AUTO_INCREMENT, PRIMARY KEY (id)
									 )"
    mysql -u $user -p${password} -e "use $db_name; 
									 create table data (
									 	id int not null AUTO_INCREMENT, PRIMARY KEY (id)
									 )"
fi

