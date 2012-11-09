#!/bin/sh

src=$1
from=$2
to=$3

mkdir tmp
cp $src tmp/
cd tmp
tar xzf $src
fullname=${src%.tar.gz}
shortname=${fullname%%-*}
params=${fullname#*-}
cd ../

./do-execution-times.py tmp/$fullname "$from" "$to" \
    | sed "s/^/$fullname,$shortname,$params,/"

rm -rf tmp

