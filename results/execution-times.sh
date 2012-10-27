#!/bin/sh

start_times=`cat log/global-manager.log |grep 'Started processing an underload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed processing an underload request' | cut -d ' ' -f 1,2`

echo "Processing underload requests:"
python2 mean-execution-time.py "$start_times" "$end_times"


start_times=`cat log/global-manager.log |grep 'Started processing an overload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed processing an overload request' | cut -d ' ' -f 1,2`

echo "Processing overload requests:"
python2 mean-execution-time.py "$start_times" "$end_times"


start_times=`cat log/global-manager.log |grep 'Started migration of VM' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed migration of VM' | cut -d ' ' -f 1,2`

echo "VM migration:"
python2 mean-execution-time.py "$start_times" "$end_times"
