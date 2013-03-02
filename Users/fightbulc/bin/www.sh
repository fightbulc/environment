#!/bin/bash

SUDO="sudo"
WWW_SCRIPT="/usr/local/sbin/nginx"

PHP_FPM_SCRIPT="/usr/local/sbin/php-fpm"
PHP_INI="-c /usr/local/etc/php/5.4/php.ini"

RETVAL=0

#################################################

case "$1" in

start)
echo "Starting nginx..."
$SUDO $WWW_SCRIPT

echo "Starting php-fpm..."
$PHP_FPM_SCRIPT $PHP_INI

RETVAL=$?
;;

#################################################

stop)
echo "Stopping nginx..."
$SUDO $WWW_SCRIPT -s stop

echo "Stopping php-fpm..."
killall -9 php-fpm

RETVAL=$?
;;

#################################################

restart)
echo "Restarting nginx..."
$SUDO $WWW_SCRIPT -s reload

echo "Restarting php-fpm..."
killall -9 php-fpm
$PHP_FPM_SCRIPT $PHP_INI

RETVAL=$?
;;

#################################################

*)
echo "Usage: php-fastcgi {start|stop|restart}"
exit 1
;;

#################################################

esac
exit $RETVAL

