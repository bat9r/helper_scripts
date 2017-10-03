#!/bin/bash

#For CentOS 7

user_name="nagios"
#user_name=$1
admin_name="nagiosadmin"
#admin_name=$2

#Security-Enhanced Linux
sudo sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
sudo setenforce 0

#Prerequisites
sudo yum install -y gcc glibc glibc-common wget unzip httpd php gd gd-devel

#Downloading the Source
cd /tmp
sudo wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.3.4.tar.gz
tar xzf nagioscore.tar.gz

#Compile
cd /tmp/nagioscore-nagios-4.3.4/
./configure
sudo make all

#Create User And Group
sudo useradd $user_name
sudo usermod -a -G $user_name apache

#Install Binaries
sudo make install

#Install Service / Daemon
sudo make install-init
sudo systemctl enable nagios.service
sudo systemctl enable httpd.service

#Install Command Mode
sudo make install-commandmode

#Install Configuration Files
sudo make install-config

#Install Apache Config Files 
sudo make install-webconf

#Configure Firewall
sudo firewall-cmd --zone=public --add-port=80/tcp
sudo firewall-cmd --zone=public --add-port=80/tcp --permanent

#Create nagiosadmin User Account 
sudo htpasswd -c /usr/local/nagios/etc/htpasswd.users $admin_name

#Start Apache Web Server
sudo systemctl start httpd.service

#Start Service / Daemon
sudo systemctl start nagios.service
