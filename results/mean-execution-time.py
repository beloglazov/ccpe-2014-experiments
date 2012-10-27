# Copyright 2012 Anton Beloglazov
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

import sys
import datetime
from pprint import pprint

if len(sys.argv) < 3:
    print 'You must specify 2 arguments:'
    print '1. A list of start times'
    print '2. A list of end times'
    sys.exit(1)

start_times = [datetime.datetime.strptime(x, "%Y-%m-%d %H:%M:%S,%f") 
               for x in sys.argv[1].split('\n')]
end_times = [datetime.datetime.strptime(x, "%Y-%m-%d %H:%M:%S,%f") 
             for x in sys.argv[2].split('\n')]


def total_microseconds(delta):
    return delta.microseconds + \
           (delta.seconds + delta.days * 24 * 3600) * 1000000

pairs = []
start_times_reversed = list(reversed(start_times))
end_times_reversed = list(reversed(end_times))

for i in xrange(len(start_times)):
    if not start_times_reversed or not end_times_reversed:
        break
    while i < len(start_times_reversed) and \
          start_times_reversed[i] > end_times_reversed[i]:
        del start_times_reversed[i]
    if i < len(start_times_reversed) and i < len(end_times_reversed) and \
            start_times_reversed[i] < end_times_reversed[i]:
        pairs.append((start_times_reversed[i], end_times_reversed[i]))

deltas = [total_microseconds(end - start) for start, end in pairs]
for delta in deltas:
    print float(delta) / 1000000

mean = int(round(float(sum(deltas)) / len(deltas)))

print 'Mean:'
print mean
