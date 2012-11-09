#!/bin/sh

output1=metrics.csv
output2=execution-times.csv
rm $output1
rm $output2

./do-one.sh \
    mhod-0.01-0.95.tar.gz '2012-11-05 10:47:41' '2012-11-06 10:47:41' $output1 $output2
./do-one.sh \
    mhod-0.1.tar.gz '2012-10-30 14:19:26' '2012-10-31 14:19:26' $output1 $output2