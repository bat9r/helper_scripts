#CentOS7

mytoken="1qazxsw23edc"

sudo yum -y install wget
sudo yum -y install httpd
sudo yum install php
cd /tmp
sudo wget -O nrdp.tar.gz https://github.com/NagiosEnterprises/nrdp/archive/1.4.0.tar.gz
sudo tar -xzf nrdp.tar.gz
cd /tmp/nrdp-1.4.0/
sudo mkdir -p /usr/local/nrdp
cd /tmp/nrdp-1.4.0/
sudo cp -r clients server LICENSE* CHANGES* /usr/local/nrdp
sudo chown -R nagios:nagios /usr/local/nrdp 
sudo sed -i "s/cfg\['authorized_tokens'\]\ =\ array(/cfg['authorized_tokens'] = array(\"$mytoken\",\ /g" /usr/local/nrdp/server/config.inc.php
#Check this before using
sudo sed -i 's/cfg\[\"command_file\"\].*/cfg\[\"command_file\"\]\ =\ \"\/var\/spool\/nagios\/cmd\/nagios.cmd\";/g' /usr/local/nrdp/server/config.inc.php
#Check this before using
sudo cp nrdp.conf /etc/httpd/conf.d/
sed -i 's/<\/Directory>/Require all granted\n&/' /etc/httpd/conf.d/nrdp.conf
systemctl restart httpd.service
