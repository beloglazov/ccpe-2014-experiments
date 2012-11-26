#!/bin/sh

output1=metrics.csv
output2=execution-times.csv
rm $output1
rm $output2

./do-one.sh \
    thr-2-0.8.tar.gz '2012-11-21 19:11:21' '2012-11-22 19:11:21' $output1 $output2
./do-one.sh \
    lr-1.0-30.tar.gz '2012-11-23 12:31:03' '2012-11-24 12:31:03' $output1 $output2
./do-one.sh \
    mhod-0.01-0.8.tar.gz '2012-11-20 17:19:03' '2012-11-21 17:19:03' $output1 $output2


#./do-one.sh \
#    mhod-0.01-0.95.tar.gz '2012-11-05 10:47:41' '2012-11-06 10:47:41' $output1 $output2
#./do-one.sh \
#    mhod-0.1.tar.gz '2012-10-30 14:19:26' '2012-10-31 14:19:26' $output1 $output2