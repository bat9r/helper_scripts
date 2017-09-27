#!/bin/bash

#CentOS 7 (sudo)

#Install java 7
echo "y" | sudo yum install java-1.7.0-openjdk
sudo alternatives --config java

#Install maven
cd /opt
sudo yum install wget
wget http://www-eu.apache.org/dist/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
sudo tar xzf apache-maven-3.5.0-bin.tar.gz
sudo ln -s apache-maven-3.5.0  maven
sudo touch maven.sh
sudo echo -e "\n export M2_HOME=/opt/maven \n export PATH=${M2_HOME}/bin:${PATH} " | sudo tee --append /etc/profile.d/maven.sh
rm -f /opt/apache-maven-3.5.0-bin.tar.gz

#Install tomcat
echo "y" | sudo yum install tomcat
sudo echo -e 'JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"' | sudo tee --append /usr/share/tomcat/conf/tomcat.conf
echo "y" | sudo yum install tomcat-webapps tomcat-admin-webapps 
echo "y" | sudo yum install tomcat-docs-webapp tomcat-javadoc
sudo sed '/<\/tomcat-users>/i \n<role rolename="manager-gui"\/>\n<role rolename="manager-script"\/>\n<user username="admin" password="password" roles="manager-gui,admin-gui"\/>\n' /usr/share/tomcat/conf/tomcat-users.xml | sudo tee /usr/share/tomcat/conf/tomcat-users2.xml
sudo mv /usr/share/tomcat/conf/tomcat-users2.xml /usr/share/tomcat/conf/tomcat-users.xml
sudo systemctl start tomcat
sudo systemctl enable tomcat

