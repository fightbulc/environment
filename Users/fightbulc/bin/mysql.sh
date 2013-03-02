#!/bin/bash

MYSQL="mysql.server"
RETVAL=0

#################################################

case "$1" in

start)
echo "Starting mysql..."
$MYSQL start

RETVAL=$?
;;

#################################################

stop)
echo "Stopping mysql..."
$MYSQL stop

RETVAL=$?
;;

#################################################

restart)
echo "Restarting mysql..."
$MYSQL restart

RETVAL=$?
;;

#################################################

*)
echo "Usage: mysql.sh {start|stop|restart}"
exit 1
;;

#################################################

esac
exit $RETVAL

