#!/bin/sh

start_times=`cat $1 |grep "$2" | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep "$3" | cut -d ' ' -f 1,2`

python2 execution-times.py "$4" "$5" "$start_times" "$end_times"
