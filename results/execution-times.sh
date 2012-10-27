#!/bin/sh

start_times=`cat log/global-manager.log |grep 'Started processing an underload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed processing an underload request' | cut -d ' ' -f 1,2`

echo -e "Processing underload requests:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started processing an underload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Skipped an underload request' | cut -d ' ' -f 1,2`

echo -e "Skipped underload requests:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started underload VM placement' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed underload VM placement' | cut -d ' ' -f 1,2`

echo -e "Underload VM placement:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started underload VM migrations' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed underload VM migrations' | cut -d ' ' -f 1,2`

echo -e "Underload VM migrations:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"



start_times=`cat log/global-manager.log |grep 'Started processing an overload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed processing an overload request' | cut -d ' ' -f 1,2`

echo -e "Processing overload requests:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started processing an overload request' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Skipped an overload request' | cut -d ' ' -f 1,2`

echo -e "Skipped overload requests:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

start_times=`cat log/global-manager.log |grep 'Started overload VM placement' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed overload VM placement' | cut -d ' ' -f 1,2`

echo -e "Overload VM placement:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started overload VM migrations' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed overload VM migrations' | cut -d ' ' -f 1,2`

echo -e "Overload VM migrations:\n"
python2 mean-execution-time.py "$start_times" "$end_times"

echo -e "\n-------------------------\n"



echo -e "\n-------------------------\n"

start_times=`cat log/global-manager.log |grep 'Started migration of VM' | cut -d ' ' -f 1,2`
end_times=`cat log/global-manager.log |grep 'Completed migration of VM' | cut -d ' ' -f 1,2`

echo -e "VM migration:\n"
python2 mean-execution-time.py "$start_times" "$end_times"
