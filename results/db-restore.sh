#!/bin/sh

mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWORD neat < $1
