#!/bin/sh

mysqldump --host=localhost --user=root --password=$MYSQL_ROOT_PASSWORD neat > db.sql
tar -czf db.tar.gz db.sql
rm db.sql