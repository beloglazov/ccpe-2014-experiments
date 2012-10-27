#!/bin/sh

rm -f workload-distributor-server.log
python2 workload-distributor.py full-utilization &> workload-distributor-server.log
