#!/bin/sh

src=$1
from=$2
to=$3

fullname=${src%.tar.gz}
shortname=${fullname%%-*}
params=${fullname#*-}

mkdir tmp
cp $src tmp/
cd tmp
tar xzf $src
cd $fullname
tar xzf db.tar.gz
cd ../../

echo
echo $fullname

./db-restore.sh tmp/$fullname/db.sql

python2 times-per-host.py root $MYSQL_ROOT_PASSWORD "$from" "$to"

./db-drop.sh

rm -rf tmp
