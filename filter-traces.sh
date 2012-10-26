#!/bin/sh

lower_threshold=20
lower_fraction=0.1
upper_threshold=80
upper_fraction=0.1

python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110303 ./planetlab-20110303-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110306 ./planetlab-20110306-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110309 ./planetlab-20110309-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110322 ./planetlab-20110322-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110325 ./planetlab-20110325-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110403 ./planetlab-20110403-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110409 ./planetlab-20110409-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110411 ./planetlab-20110411-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110412 ./planetlab-20110412-filtered
python2 workload-filter.py $lower_threshold $lower_fraction $upper_threshold $upper_fraction ~/repos/cloudsim/modules/cloudsim-examples/src/main/resources/workload/planetlab/20110420 ./planetlab-20110420-filtered

mkdir planetlab-filtered
cp planetlab-*-filtered/* planetlab-filtered/
rm -rf planetlab-*-filtered
