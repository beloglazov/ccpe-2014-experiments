#!/bin/sh

rm -f workload-distributor-server.log
python2 workload-distributor.py planetlab-selected > workload-distributor-server.log
