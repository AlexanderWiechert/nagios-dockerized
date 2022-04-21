#/bin/bash
set -e

NAGIOS_PLUGINS_VERSION="2.3.3"

#download and install nagios
wget https://github.com/nagios-plugins/nagios-plugins/archive/release-$NAGIOS_PLUGINS_VERSION.tar.gz

#download and install nagios plugins
tar xfz release-$NAGIOS_PLUGINS_VERSION.tar.gz
cd nagios-plugins-release-$NAGIOS_PLUGINS_VERSION/
./tools/setup
./configure
make
make install