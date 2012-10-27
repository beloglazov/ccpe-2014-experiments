#!/bin/sh

cat workload-distributor-server.log | egrep 'GET.*200' | cut -d ' ' -f 1 | sort -u

echo ''
echo "Total: `cat workload-distributor-server.log | egrep 'GET.*200' | cut -d ' ' -f 1 | sort -u | wc -l`"