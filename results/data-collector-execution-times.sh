#!/bin/sh

start_times=`cat $1 |grep 'Started an iteration' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed an iteration' | cut -d ' ' -f 1,2`

echo -e "A data collection iteration:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat $1 |grep 'Started VM data collection' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed VM data collection' | cut -d ' ' -f 1,2`

echo -e "VM data collection:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat $1 |grep 'Started host data collection' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed host data collection' | cut -d ' ' -f 1,2`

echo -e "Host data collection:\n"
python2 mean-execution-time.py "$start_times" "$end_times"
