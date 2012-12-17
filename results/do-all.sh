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
    mhod-0.01-0.8.tar.gz '2012-11-20 17:19:03' '2012-11-21 17:19:03' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8.tar.gz '2012-11-29 11:01:39' '2012-11-30 11:01:39' $output1 $output2
./do-one.sh \
    mhod-0.2-0.8.tar.gz '2012-12-01 16:55:53' '2012-12-02 16:55:53' $output1 $output2

./do-one.sh \
    best-idf.tar.gz '2012-12-04 13:50:14' '2012-12-05 13:50:14' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8-2.tar.gz '2012-12-05 16:09:24' '2012-12-06 16:09:24' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8-3.tar.gz '2012-12-06 17:16:35' '2012-12-07 17:16:35' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8-100.tar.gz '2012-12-07 18:55:18' '2012-12-08 18:55:18' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8-100-2.tar.gz '2012-12-09 12:25:38' '2012-12-10 12:25:38' $output1 $output2
./do-one.sh \
    mhod-0.1-0.8-100-3.tar.gz '2012-12-14 11:33:37' '2012-12-15 11:33:37' $output1 $output2

./do-one.sh \
    mhod-0.15-0.8-100-1.tar.gz '2012-12-15 12:30:44' '2012-12-16 12:30:44' $output1 $output2
