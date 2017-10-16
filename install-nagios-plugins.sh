#!/bin/bash

#CentOS 7

#Prerequisites
sudo yum install -y gcc glibc glibc-common make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release
sudo yum install -y perl-Net-SNMP

#Downloading The Source
cd /tmp
sudo wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz

#Compile + Install
cd /tmp/nagios-plugins-release-2.2.1/
./tools/setup
./configure
sudo make
sudo make install

sudo wget -O /etc/local/nagios/libexec/check_galera_cluster https://raw.githubusercontent.com/fridim/nagios-plugin-check_galera_cluster/master/check_galera_cluster
chmod +x check_galera_cluster
#Service / Daemon Command
sudo systemctl restart nagios.service
