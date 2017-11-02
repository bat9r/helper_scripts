#Security-Enhanced Linux
sudo sed -i 's/SELINUX=.*/SELINUX=permissive/g' /etc/selinux/config
sudo setenforce 0

#Install ntp
yum -y install ntp
systemctl start ntpd
systemctl enable ntpd

yum -y install nfs-utils

#Firewall open
firewall-cmd --zone=public --add-port=111/tcp
firewall-cmd --zone=public --add-port=111/tcp --permanent

firewall-cmd --zone=public --add-port=111/udp
firewall-cmd --zone=public --add-port=111/udp --permanent

firewall-cmd --zone=public --add-port=2049/tcp
firewall-cmd --zone=public --add-port=2049/tcp --permanent

firewall-cmd --zone=public --add-port=32803/tcp
firewall-cmd --zone=public --add-port=32803/tcp --permanent

firewall-cmd --zone=public --add-port=32769/udp
firewall-cmd --zone=public --add-port=32769/udp --permanent

firewall-cmd --zone=public --add-port=892/tcp
firewall-cmd --zone=public --add-port=892/tcp --permanent

firewall-cmd --zone=public --add-port=892/udp
firewall-cmd --zone=public --add-port=892/udp --permanent

firewall-cmd --zone=public --add-port=875/tcp
firewall-cmd --zone=public --add-port=875/tcp --permanent

firewall-cmd --zone=public --add-port=875/udp
firewall-cmd --zone=public --add-port=875/udp --permanent

firewall-cmd --zone=public --add-port=662/tcp
firewall-cmd --zone=public --add-port=662/tcp --permanent

firewall-cmd --zone=public --add-port=662/udp
firewall-cmd --zone=public --add-port=662/udp --permanent

firewall-cmd --zone=public --add-port=8080/tcp
firewall-cmd --zone=public --add-port=8080/tcp --permanent

firewall-cmd --zone=public --add-port=80/tcp
firewall-cmd --zone=public --add-port=80/tcp --permanent

firewall-cmd --zone=public --add-port=9000/tcp
firewall-cmd --zone=public --add-port=9000/tcp --permanent

firewall-cmd --zone=public --add-port=22/tcp
firewall-cmd --zone=public --add-port=22/tcp --permanent
