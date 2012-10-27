#!/bin/sh

start_times=`cat log/global-manager.log |grep 'Started processing an overload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed processing an overload request' | cut -d ' ' -f 1,2`

#echo 'starts:'
#echo $start_times
#echo 'ends:'
#echo $end_times

python2 mean-execution-time.py "$start_times" "$end_times"