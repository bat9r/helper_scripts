#CentOS 7

sudo rpm -Uvh http://repo.nagios.com/nagios/7/nagios-repo-7-2.el7.noarch.rpm
yum install ncpa -y
sudo systemctl start ncpa_listener
sudo systemctl start ncpa_passive
