#!/bin/bash

#STABLE 

sudo apt-get update -y 
sudo apt-get upgrade -y
sudo apt-get install mdadm -y 
sudo apt-get install lvm2 -y
sudo apt-get install git -y
sudo apt-get install rsync 

#establecer hora de buenos aires
sudo -S timedatectl set-timezone "America/Argentina/Buenos_Aires"

PASS_MYSQL_ROOT=`openssl rand -base64 12` # Save this password 
echo "PASS_MYSQL_ROOT=${PASS_MYSQL_ROOT}" >> .env

#apache packages 
sudo apt-get install apache2 apache2-doc apache2-utils -y 
#apache php packages 
sudo apt-get install php libapache2-mod-php php-mysql -y 

#mysql packages  continue here 
apt-get install gnupg -y
cd /tmp/
wget https://dev.mysql.com/get/mysql-apt-config_0.8.22-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.22-1_all.deb

# Install MySQL Server in a Non-Interactive mode. Default root password will be "${PASS_MYSQL_ROOT}"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/root-pass password ${PASS_MYSQL_ROOT}"
sudo debconf-set-selections <<< "mysql-community-server mysql-community-server/re-root-pass password ${PASS_MYSQL_ROOT}"
sudo apt-get update -y 
DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server
