#/bin/bash
set -e

/etc/init.d/nagios start
/etc/init.d/postfix start

/usr/sbin/apache2ctl -DFOREGROUND