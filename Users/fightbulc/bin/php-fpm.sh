#!/bin/bash

PHP_SCRIPT="/usr/local/sbin/php-fpm"
PHP_PARGS="-c /usr/local/etc/php/5.4/php.ini"

RETVAL=0

case "$1" in

start)
$PHP_SCRIPT $PHP_PARGS
RETVAL=$?
;;

stop)
killall -9 php-fpm
RETVAL=$?
;;

restart)
killall -9 php-fpm
$PHP_SCRIPT $PHP_PARGS

RETVAL=$?
;;

*)
echo "Usage: php-fastcgi {start|stop|restart}"
exit 1
;;

esac
exit $RETVAL
