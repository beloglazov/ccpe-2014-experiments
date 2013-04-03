#!/bin/sh

output1=metrics.csv
output2=execution-times.csv
rm $output1
rm $output2

# ./do-one.sh \
#     thr-2-0.8.tar.gz '2012-11-21 19:11:21' '2012-11-22 19:11:21' $output1 $output2
# #./do-one.sh \
# #    thr-2-0.8-2.tar.gz '2012-12-03 10:28:24' '2012-12-04 10:28:24' $output1 $output2
# ./do-one.sh \
#     lr-1.0-30.tar.gz '2012-11-23 12:31:03' '2012-11-24 12:31:03' $output1 $output2
# ./do-one.sh \
#     best-idf.tar.gz '2012-12-04 13:50:14' '2012-12-05 13:50:14' $output1 $output2

# ./do-one.sh \
#     mhod-0.8-0.10-500-1.tar.gz '2012-12-20 10:59:47' '2012-12-21 10:59:47' $output1 $output2
# ./do-one.sh \
#     mhod-0.8-0.10-500-2.tar.gz '2012-12-21 16:05:20' '2012-12-22 16:05:20' $output1 $output2

# ./do-one.sh \
#     mhod-0.8-0.10-500-0.7-1.tar.gz '2012-12-22 19:09:36' '2012-12-23 19:09:36' $output1 $output2

# ./do-one.sh \
#     mhod-0.8-0.20-500-0.7-1.tar.gz '2012-12-24 14:28:33' '2012-12-25 14:28:33' $output1 $output2

# ./do-one.sh \
#     mhod-0.8-0.20-500-0.8-1.tar.gz '2012-12-25 18:23:03' '2012-12-26 18:23:03' $output1 $output2

# ./do-one.sh \
#     mhod-0.8-0.20-500-0.8-only-n-1.tar.gz '2012-12-27 13:03:28' '2012-12-28 13:03:28' $output1 $output2
# ./do-one.sh \
#     mhod-0.8-0.30-500-0.8-only-n-1.tar.gz '2012-12-29 13:55:13' '2012-12-30 13:55:13' $output1 $output2

./do-one.sh \
    thr-2-0.8-1.tar.gz '2013-01-07 18:57:57' '2013-01-08 18:57:57' $output1 $output2
./do-one.sh \
    thr-2-0.8-2.tar.gz '2012-12-31 17:20:06' '2013-01-01 17:20:06' $output1 $output2
./do-one.sh \
    thr-2-0.8-3.tar.gz '2013-01-01 18:16:25' '2013-01-02 18:16:25' $output1 $output2

./do-one.sh \
    best-idf-1.tar.gz '2013-01-09 09:17:11' '2013-01-10 09:17:11' $output1 $output2
./do-one.sh \
    best-idf-2.tar.gz '2013-01-10 10:41:12' '2013-01-11 10:41:12' $output1 $output2
./do-one.sh \
    best-idf-3.tar.gz '2013-01-11 13:50:41' '2013-01-12 13:50:41' $output1 $output2

./do-one.sh \
    lrr-0.8-1.0-30.tar.gz '2013-01-12 19:53:18' '2013-01-13 19:53:18' $output1 $output2
./do-one.sh \
    lrr-0.8-1.0-30-2.tar.gz '2013-01-14 11:08:59' '2013-01-15 11:08:59' $output1 $output2
./do-one.sh \
    lrr-0.8-1.0-30-3.tar.gz '2013-01-15 12:26:57' '2013-01-16 12:26:57' $output1 $output2

 ./do-one.sh \
     lrr-0.8-0.9-30-1.tar.gz '2013-01-16 13:55:32' '2013-01-17 13:55:32' $output1 $output2
 ./do-one.sh \
     lrr-0.8-0.9-30-2.tar.gz '2013-01-18 10:36:38' '2013-01-19 10:36:38' $output1 $output2
 ./do-one.sh \
     lrr-0.8-0.9-30-3.tar.gz '2013-01-19 12:10:29' '2013-01-20 12:10:29' $output1 $output2

#  ./do-one.sh \
#      otf-0.8-0.2.tar.gz '2013-01-23 16:19:19' '2013-01-24 16:19:19' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-2.tar.gz '2013-01-25 11:45:37' '2013-01-26 11:45:37' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-3.tar.gz '2013-01-26 14:40:07' '2013-01-27 14:40:07' $output1 $output2

# # Fixed: 
#  ./do-one.sh \
#      otf-0.8-0.2-4.tar.gz '2013-01-28 16:27:05' '2013-01-29 16:27:05' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-5.tar.gz '2013-01-30 10:56:02' '2013-01-31 10:56:02' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-6.tar.gz '2013-01-31 17:14:19' '2013-02-01 17:14:19' $output1 $output2
# # After time sync
#  ./do-one.sh \
#      otf-0.8-0.2-7.tar.gz '2013-02-02 11:39:23' '2013-02-03 11:39:23' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-8.tar.gz '2013-02-05 10:13:15' '2013-02-06 10:13:15' $output1 $output2
#  ./do-one.sh \
#      otf-0.8-0.2-9.tar.gz '2013-02-06 18:13:20' '2013-02-07 18:13:20' $output1 $output2

#  ./do-one.sh \
#      otf-0.8-0.1-1.tar.gz '2013-02-08 13:33:24' '2013-02-09 13:33:24' $output1 $output2

# ./do-one.sh \
#      otf-0.8-0.3-1.tar.gz '2013-02-09 16:10:18' '2013-02-10 16:10:18' $output1 $output2

# ./do-one.sh \
#      otf-0.8-0.1-0.7-1.tar.gz '2013-02-11 12:14:59' '2013-02-12 12:14:59' $output1 $output2

# ./do-one.sh \
#      otf-0.8-0.2-0.7-1.tar.gz '2013-02-12 15:12:57' '2013-02-13 15:12:57' $output1 $output2


./do-one.sh \
     mhod-0.8-0.20-0.8-1.tar.gz '2013-02-13 19:58:33' '2013-02-14 19:58:33' $output1 $output2
./do-one.sh \
     mhod-0.8-0.20-0.8-2.tar.gz '2013-02-18 12:19:33' '2013-02-19 12:19:33' $output1 $output2
./do-one.sh \
     mhod-0.8-0.20-0.8-3.tar.gz '2013-02-20 10:37:44' '2013-02-21 10:37:44' $output1 $output2

#./do-one.sh \
#     mhod-0.8-0.30-0.8-1.tar.gz '2013-02-15 10:23:38' '2013-02-16 10:23:38' $output1 $output2

# ./do-one.sh \
#     lr-1.0-1.tar.gz '2013-02-21 11:31:00' '2013-02-22 11:31:00' $output1 $output2

 ./do-one.sh \
     lrr-0.9-1.tar.gz '2013-02-27 10:22:20' '2013-02-28 10:22:20' $output1 $output2
 ./do-one.sh \
     lrr-0.9-2.tar.gz '2013-03-04 21:49:07' '2013-03-05 21:49:07' $output1 $output2
 ./do-one.sh \
     lrr-0.9-3.tar.gz '2013-03-02 12:11:08' '2013-03-03 12:11:08' $output1 $output2

 ./do-one.sh \
     lrr-1.0-1.tar.gz '2013-02-22 16:57:53' '2013-02-23 16:57:53' $output1 $output2
 ./do-one.sh \
     lrr-1.0-2.tar.gz '2013-02-24 11:25:07' '2013-02-25 11:25:07' $output1 $output2
 ./do-one.sh \
     lrr-1.0-3.tar.gz '2013-02-25 18:46:03' '2013-02-26 18:46:03' $output1 $output2

 ./do-one.sh \
     lrr-1.1-1.tar.gz '2013-03-06 11:42:44' '2013-03-07 11:42:44' $output1 $output2
 ./do-one.sh \
     lrr-1.1-2.tar.gz '2013-03-08 20:58:56' '2013-03-09 20:58:56' $output1 $output2
 ./do-one.sh \
     lrr-1.1-3.tar.gz '2013-03-11 13:51:37' '2013-03-12 13:51:37' $output1 $output2

./do-one.sh \
     thr-0.8-1.tar.gz '2013-03-13 11:08:26' '2013-03-14 11:08:26' $output1 $output2
./do-one.sh \
     thr-0.8-2.tar.gz '2013-03-15 09:45:42' '2013-03-16 09:45:42' $output1 $output2
./do-one.sh \
     thr-0.8-3.tar.gz '2013-03-18 13:23:49' '2013-03-19 13:23:49' $output1 $output2

./do-one.sh \
     thr-0.9-1.tar.gz '2013-03-19 15:56:06' '2013-03-20 15:56:06' $output1 $output2
./do-one.sh \
     thr-0.9-2.tar.gz '2013-03-21 14:22:36' '2013-03-22 14:22:36' $output1 $output2
./do-one.sh \
     thr-0.9-3.tar.gz '2013-03-22 16:52:13' '2013-03-23 16:52:13' $output1 $output2

./do-one.sh \
     thr-1.0-1.tar.gz '2013-03-25 13:48:19' '2013-03-26 13:48:19' $output1 $output2
./do-one.sh \
     thr-1.0-2.tar.gz '2013-03-26 18:30:37' '2013-03-27 18:30:37' $output1 $output2
./do-one.sh \
     thr-1.0-3.tar.gz '2013-03-28 10:46:12' '2013-03-29 10:46:12' $output1 $output2

./do-one.sh \
     max-idf-1.tar.gz '2013-04-02 11:20:30' '2013-04-03 11:20:30' $output1 $output2
