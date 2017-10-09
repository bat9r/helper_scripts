mkdir ~/downloads
cd ~/downloads
wget http://www.nagios-plugins.org/download/nagios-plugins-2.1.1.tar.gz
tar xzf nagios-plugins-2.1.1.tar.gz
cd nagios-plugins-2.1.1
./configure
make
make install
chown nagios.nagios /usr/local/nagios
chown -R nagios.nagios /usr/local/nagios/libexec
sudo yum install xinetd
cd ~/downloads
wget https://github.com/NagiosEnterprises/nrpe/archive/nrpe-3.0.tar.gz
tar xzf nrpe-3.0.tar.gz
cd nrpe-nrpe-3.0
make install-groups-users
make install
make install-config
make install-inetd
make install-init
service xinetd restart
systemctl reload xinetd
systemctl enable nrpe && systemctl start nrpe
sudo firewall-cmd --zone=public --add-port=5666/tcp
sudo firewall-cmd --zone=public --add-port=5666/tcp --permanent
