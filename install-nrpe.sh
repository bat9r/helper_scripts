#Vars
allowed_ip="192.168.103.233"

#Install nrpe
sudo yum install -y gcc glibc glibc-common openssl-devel perl wget
cd /tmp
sudo wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-3.2.1.tar.gz
sudo tar xzf nrpe.tar.gz
cd /tmp/nrpe-nrpe-3.2.1/
sudo ./configure --enable-command-args
sudo make all
sudo make install-groups-users
sudo make install
sudo make install-config
sudo echo | sudo tee --append /etc/services
sudo echo "# Nagios services" | sudo tee --append /etc/services
sudo echo "nrpe     5666/tcp" | sudo tee --append /etc/services
sudo make install-init
sudo systemctl enable nrpe.service
sudo firewall-cmd --zone=public --add-port=5666/tcp
sudo firewall-cmd --zone=public --add-port=5666/tcp --permanent
sudo sed -i "/^allowed_hosts=/s/$/,$allowed_ip/" /usr/local/nagios/etc/nrpe.cfg
sudo sed -i 's/^dont_blame_nrpe=.*/dont_blame_nrpe=1/g' /usr/local/nagios/etc/nrpe.cfg
systemctl start nrpe.service
