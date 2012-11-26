#!/bin/sh

src=$1
from=$2
to=$3
output_metrics=$4
output_execution_times=$5

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

./do-metrics.sh tmp/$fullname/db.sql "$from" "$to" \
    | sed "s/^/$fullname,$shortname,$params,/" >> $output_metrics

./do-execution-times.py tmp/$fullname "$from" "$to" \
    | sed "s/^/$fullname,$shortname,$params,/" >> $output_execution_times

rm -rf tmp
