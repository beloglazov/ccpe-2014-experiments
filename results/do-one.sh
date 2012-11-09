#!/bin/sh

src=$1
from=$2
to=$3
output_metrics=$4
output_execution_times=$5

mkdir tmp
cp $src tmp/
cd tmp
tar xzf db.tar.gz
tar xzf $src
fullname=${src%.tar.gz}
shortname=${fullname%%-*}
params=${fullname#*-}
cd ../

./do-metrics.py tmp/$fullname/db.sql "$from" "$to" \
    | sed "s/^/$fullname,$shortname,$params,/" >> $output_metrics

./do-execution-times.py tmp/$fullname "$from" "$to" \
    | sed "s/^/$fullname,$shortname,$params,/" >> $output_execution_times

rm -rf tmp
