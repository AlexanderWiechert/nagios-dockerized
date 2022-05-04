#/bin/bash
set -e

NAGIOS_VERSION="4.4.7"

#install requirements
apt-get update
echo "Acquire::http::No-Cache true;" > /etc/apt/apt.conf && \
echo "Acquire::http::Pipeline-Depth 0;" >> /etc/apt/apt.conf && \
apt-get install -y wget unzip zip autoconf gcc libc6 make apache2-utils libgd-dev apache2 libapache2-mod-php php mailutils iputils-ping \
libmcrypt-dev make libssl-dev bc gawk dc build-essential snmp libnet-snmp-perl gettext libldap2-dev smbclient fping libmysqlclient-dev libdbi-dev

#add nagios user
useradd nagios
usermod -a -G nagios www-data

#download and install nagios
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-$NAGIOS_VERSION.tar.gz
tar xzf nagios-$NAGIOS_VERSION.tar.gz
cd nagios-$NAGIOS_VERSION
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all
make install
make install-init
make install-commandmode
make install-config
make install-webconf
#
##enable and start service
##systemctl enable nagios.service
a2enmod cgi

#set credentials for basic auth
htpasswd -cb /usr/local/nagios/etc/htpasswd.users nagiosadmin ties4711

#disable due memory leak
sed -i 's/check_for_updates=1/check_for_updates=0/g' /usr/local/nagios/etc/nagios.cfg

