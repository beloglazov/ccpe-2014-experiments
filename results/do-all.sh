#!/bin/sh

output1=metrics.csv
output2=execution-times.csv
rm $output1
rm $output2

./do-one.sh \
    thr-2-0.8.tar.gz '2012-11-21 19:11:21' '2012-11-22 19:11:21' $output1 $output2
./do-one.sh \
    thr-2-0.8-2.tar.gz '2012-12-03 10:28:24' '2012-12-04 10:28:24' $output1 $output2
./do-one.sh \
    lr-1.0-30.tar.gz '2012-11-23 12:31:03' '2012-11-24 12:31:03' $output1 $output2
./do-one.sh \
    best-idf.tar.gz '2012-12-04 13:50:14' '2012-12-05 13:50:14' $output1 $output2

./do-one.sh \
    mhod-0.8-0.10-500-1.tar.gz '2012-12-20 10:59:47' '2012-12-21 10:59:47' $output1 $output2
./do-one.sh \
    mhod-0.8-0.10-500-2.tar.gz '2012-12-21 16:05:20' '2012-12-22 16:05:20' $output1 $output2

./do-one.sh \
    mhod-0.8-0.10-500-0.7-1.tar.gz '2012-12-22 19:09:36' '2012-12-23 19:09:36' $output1 $output2

./do-one.sh \
    mhod-0.8-0.20-500-0.7-1.tar.gz '2012-12-24 14:28:33' '2012-12-25 14:28:33' $output1 $output2

./do-one.sh \
    mhod-0.8-0.20-500-0.8-1.tar.gz '2012-12-25 18:23:03' '2012-12-26 18:23:03' $output1 $output2

./do-one.sh \
    mhod-0.8-0.20-500-0.8-only-n-1.tar.gz '2012-12-27 13:03:28' '2012-12-28 13:03:28' $output1 $output2
