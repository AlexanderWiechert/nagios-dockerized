#/bin/bash
set -e

NAGIOS_PLUGINS_VERSION="2.4.0"

#download and install nagios
wget https://github.com/nagios-plugins/nagios-plugins/releases/download/release-2.4.0/nagios-plugins-2.4.0.tar.gz

#download and install nagios plugins
tar xfz nagios-plugins-$NAGIOS_PLUGINS_VERSION.tar.gz

#install
cd nagios-plugins-$NAGIOS_PLUGINS_VERSION/
./configure
make
make install