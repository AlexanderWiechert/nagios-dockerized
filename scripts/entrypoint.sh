#/bin/bash
set -e

/etc/init.d/nagios start

/usr/sbin/apache2ctl -DFOREGROUND