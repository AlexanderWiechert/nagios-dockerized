#/bin/bash
set -e

/etc/init.d/apache2 restart
/etc/init.d/nagios start