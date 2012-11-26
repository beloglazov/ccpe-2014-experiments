#!/bin/sh

mysql --host=localhost --user=root --password=$MYSQL_ROOT_PASSWORD spe < $1
