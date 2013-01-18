#!/usr/bin/python2

import sys
import subprocess
import itertools
from pprint import pprint


if len(sys.argv) < 4:
    print 'You must specify 3 arguments:'
    print '1. The path to the directory with log files'
    print '2. The start time'
    print '3. The end time'
    sys.exit(1)

path = sys.argv[1]
start_time = sys.argv[2]
end_time = sys.argv[3]

sources = {
    ('controller',):
    [('global-manager',
      [('Started processing an underload request',
        'Completed processing an underload request'),
       ('Started processing an underload request',
        'Skipped an underload request'),
       ('Started underload VM placement',
        'Completed underload VM placement'),
       ('Started underload VM migrations',
        'Completed underload VM migrations'),
       ('Started processing an overload request',
        'Completed processing an overload request'),
       ('Started processing an overload request',
        'Skipped an overload request'),
       ('Started overload VM placement',
        'Completed overload VM placement'),
       ('Started overload VM migrations',
        'Completed overload VM migrations'),
       ('Started migration of VM',
        'Completed migration of VM')])],

    ('compute1', 'compute2', 'compute3', 'compute4'):
    [('data-collector',
      [('Started an iteration',
        'Completed an iteration'),
       ('Started VM data collection',
        'Completed VM data collection'),
       ('Started host data collection',
        'Completed host data collection')]),
     ('local-manager',
      [('Started an iteration',
        'Completed an iteration'),
       ('Started an iteration',
        'Skipped an iteration'),
       ('Started underload detection',
        'Completed underload detection'),
       ('Started overload detection',
        'Completed overload detection'),
       ('Started VM selection',
        'Completed VM selection')])]}


rows = []
cnt = 0
for hosts, data in sources.items():
    for source, bounds in data:
        for start, end in bounds:
            times = []
            for host in hosts:
                src = '{0}/{1}/{2}.log'.format(path, host, source)
                times += subprocess.Popen(
                    ("./parse-execution-times.sh {0} '{1}' '{2}' '{3}' '{4}'").format(
                        src, start, end, start_time, end_time),
                    stdout=subprocess.PIPE,
                    shell=True).communicate()[0].strip().split()
            times_len = len(times)
            rows_len = len(rows)
            if times_len < rows_len:
                times = times + ['NaN'] * (rows_len - times_len)
            if rows_len < times_len:
                if cnt == 0:
                    rows = [''] * (times_len - rows_len)
                else:
                    rows = rows + \
                        [','.join(['NaN'] * cnt)] * (times_len - rows_len)
            for i, (old, new) in enumerate(zip(rows, times)):
                if old:
                    old += ','
                rows[i] = old + new
            cnt += 1

print '\n'.join(rows)
