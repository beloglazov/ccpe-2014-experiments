#!/bin/sh

start_times=`cat $1 |grep 'Started an iteration' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed an iteration' | cut -d ' ' -f 1,2`

echo -e "A whole iteration:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat $1 |grep 'Started an iteration' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Skipped an iteration' | cut -d ' ' -f 1,2`

echo -e "Skipped iterations:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"


start_times=`cat $1 |grep 'Started underload detection' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed underload detection' | cut -d ' ' -f 1,2`

echo -e "Underload detection:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"


start_times=`cat $1 |grep 'Started overload detection' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed overload detection' | cut -d ' ' -f 1,2`

echo -e "Overload detection:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"


start_times=`cat $1 |grep 'Started VM selection' | cut -d ' ' -f 1,2`
end_times=`cat $1 |grep 'Completed VM selection' | cut -d ' ' -f 1,2`

echo -e "VM selection:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"
