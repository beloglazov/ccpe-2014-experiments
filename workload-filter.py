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
import os
import random
import shutil

if len(sys.argv) < 7:
    print 'You must specify 6 arguments:'
    print '1. The lower threshold of the CPU utilization'
    print '2. The time fraction when the CPU utilization is below the lower threshold'
    print '3. The upper threshold of the CPU utilization'
    print '4. The time fraction when the CPU utilization is higher than the upper threshold'
    print '5. The directory containing original workload trace files'
    print '6. The directory to write the selected files to'
    sys.exit(1)


def read_file(filename):
    if not os.access(filename, os.R_OK):
        raise Exception('cannot read file: ' + filename)

    utilization = []
    for line in open(filename):
        if line.strip():
            try:
                n = float(line)
                if n < 0 or n > 100:
                    raise ValueError
                utilization.append(int(n))
            except ValueError:
                raise Exception('the source file must only ' +
                                'contain new line separated ' +
                                'numbers in the [0, 100] range')
    return utilization

lower_threshold = int(sys.argv[1])
lower_fraction = float(sys.argv[2])
upper_threshold = int(sys.argv[3])
upper_fraction = float(sys.argv[4])
src = sys.argv[5]
dest = sys.argv[6]

try:
    shutil.rmtree(dest)
except os.error:
    pass
os.makedirs(dest)

cnt = 0
for f in os.listdir(src):
    data = read_file(os.path.join(src, f))
    n = len(data)
    low_values = filter(lambda x: x <= lower_threshold, data)
    high_values = filter(lambda x: x >= upper_threshold, data)
    if (float(len(low_values)) / n >= lower_fraction and \
        float(len(high_values)) / n >= upper_fraction):
        cnt += 1
        shutil.copyfile(os.path.join(src, f),
                        os.path.join(dest, dest + '_' + f.replace(' ', '')))

print 'Selected and copied ' + str(cnt) + \
      ' workload trace files to ' + dest
