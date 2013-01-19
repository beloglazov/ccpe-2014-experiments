#!/usr/bin/python2

import sys

if len(sys.argv) < 3:
    print 'You must specify 2 arguments:'
    print '1. ITF'
    print '2. OTF'
    sys.exit(1)

itf = float(sys.argv[1])
otf = float(sys.argv[2])

activity_time = 1 - itf

utilization_threshold = 0.8
total_time = 24 * 4

power_loaded = 450
power_idle = 270
power_sleep = 10.4
power_at_threshold = power_idle + utilization_threshold * (power_loaded - power_idle)


energy_consolidation = total_time * (power_loaded * otf +
                                     power_at_threshold * (activity_time - otf) +
                                     power_sleep * itf)

total_load = utilization_threshold * activity_time
power_at_total_load = power_idle + total_load * (power_loaded - power_idle)
energy_max = total_time * power_at_total_load

energy_savings = 1 - (energy_consolidation / energy_max)

print 'Energy consolidation: ' + str(energy_consolidation / 1000) + ' kWh'
print 'Energy max: ' + str(energy_max / 1000) + ' kWh'
print 'Energy savings: ' + str(energy_savings * 100) + '%'
