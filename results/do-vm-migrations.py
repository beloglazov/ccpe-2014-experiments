#!/bin/sh

python2 vm-migrations.py root $MYSQL_ROOT_PASSWORD "$1" "$2"
