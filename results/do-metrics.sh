#!/bin/sh

./db-restore.sh $1

echo "
`python2 host-idle-time.py root $MYSQL_ROOT_PASSWORD '$1' '$2'`, \
`python2 overload-time-fraction.py root $MYSQL_ROOT_PASSWORD '$1' '$2'`, \
`python2 vm-migrations.py root $MYSQL_ROOT_PASSWORD '$1' '$2'`"

./db-drop.sh