#!/bin/sh

./db-restore.sh $1

echo "`python2 idle-time-fraction.py root $MYSQL_ROOT_PASSWORD "$2" "$3"`, \
`python2 overload-time-fraction.py root $MYSQL_ROOT_PASSWORD "$2" "$3"`, \
`python2 vm-migrations.py root $MYSQL_ROOT_PASSWORD "$2" "$3"`"

./db-drop.sh