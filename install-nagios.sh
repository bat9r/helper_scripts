#!/bin/bash

#For CentOS 7

#Security-Enhanced Linux
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

#Prerequisites
yum install -y gcc glibc glibc-common wget unzip httpd php gd gd-devel

#Downloading the Source
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.3.4.tar.gz
tar xzf nagioscore.tar.gz

#Compile
cd /tmp/nagioscore-nagios-4.3.4/
./configure
make all

#Create User And Group
echo "User name: "
read user_name
useradd $user_name
usermod -a -G nagios apache

#Install Binaries
make install

#Install Service / Daemon
make install-init
systemctl enable nagios.service
systemctl enable httpd.service

#Install Command Mode
make install-commandmode

#Install Configuration Files
make install-config

#Install Apache Config Files 
make install-webconf

#Configure Firewall
firewall-cmd --zone=public --add-port=80/tcp
firewall-cmd --zone=public --add-port=80/tcp --permanent

#Create nagiosadmin User Account 
echo "Admin name"
read admin_name
htpasswd -c /usr/local/nagios/etc/htpasswd.users $admin_name

#Start Apache Web Server
systemctl start httpd.service

#Start Service / Daemon
systemctl start nagios.service
