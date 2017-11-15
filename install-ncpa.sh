#CentOS 7
#Some todo bugs
#Variables
ncpa_token = "qazwsxedc"
nrdp_token = "1qazxsw23edc"

#Installing
sudo rpm -Uvh http://repo.nagios.com/nagios/7/nagios-repo-7-2.el7.noarch.rpm
yum install ncpa -y
sudo systemctl start ncpa_listener
sudo systemctl start ncpa_passive

#Configuring
sed -i "s/community_string\ =.*/community_string\ =\ $ncpa_token/g" /usr/local/ncpa/etc/ncpa.cfg
sed -i "s/handlers\ =.*/handlers\ =\ nrdp/g" /usr/local/ncpa/etc/ncpa.cfg
sed -i "s/parent\ =.*/parent\ =\ http:\/\/10.1.10.4\/nrdp/g" /usr/local/ncpa/etc/ncpa.cfg
sed -i "s/token\ =.*/token\ =\ $nrdp_token/g" /usr/local/ncpa/etc/ncpa.cfg
sed -i "s/hostname\ =.*/hostname\ =\ $HOSTNAME/g" /usr/local/ncpa/etc/ncpa.cfg
