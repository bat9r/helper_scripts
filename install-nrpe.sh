sudo mkdir ~/downloads
cd ~/downloads
sudo wget http://www.nagios-plugins.org/download/nagios-plugins-2.1.1.tar.gz
sudo tar xzf nagios-plugins-2.1.1.tar.gz
cd nagios-plugins-2.1.1
./configure
sudo make
sudo make install
sudo chown nagios.nagios /usr/local/nagios
sudo chown -R nagios.nagios /usr/local/nagios/libexec
sudo yum install xinetd
cd ~/downloads
sudo wget https://github.com/NagiosEnterprises/nrpe/archive/nrpe-3.0.tar.gz
sudo tar xzf nrpe-3.0.tar.gz
cd nrpe-nrpe-3.0
sudo make install-groups-users
sudo make install
sudo make install-config
sudo make install-inetd
sudo make install-init
sudo service xinetd restart
sudo systemctl reload xinetd
sudo systemctl enable nrpe && systemctl start nrpe
sudo firewall-cmd --zone=public --add-port=5666/tcp
sudo firewall-cmd --zone=public --add-port=5666/tcp --permanent
