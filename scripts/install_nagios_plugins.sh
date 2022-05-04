#/bin/bash
set -e

NAGIOS_PLUGINS_VERSION="2.4.0"

#fix


#echo "security.jail.allow_raw_sockets=1" >> /etc/sysctl.conf
#download and install nagios
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-2.4.0/nagios-plugins-2.4.0.tar.gz
#download and install nagios plugins
tar xfz nagios-plugins-$NAGIOS_PLUGINS_VERSION.tar.gz
cd nagios-plugins-$NAGIOS_PLUGINS_VERSION/
#./tools/setup
./configure
make
make install