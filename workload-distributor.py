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

import logging
logging.basicConfig(
    filename='workload-distributor.log',
    format='%(asctime)s %(levelname)-8s %(message)s',
    level=logging.DEBUG)

import sys
import os
import bottle


def is_distribution_enabled():
    enabled = False
    with open('workload-distributor.conf', 'r') as f:
        enabled = bool(int(f.read()))
        logging.info('Workload distribution enabled: ' +
                     str(enabled))
    return enabled


@bottle.get('/')
def poll():
    logging.info('Received a request from %s', bottle.request.remote_addr)
    try:
        if is_distribution_enabled():
            command = 'python2 ~/cpu-load-generator/cpu-load-generator.py -n 1 20 ' + \
                      '~/spe-2012-experiments/planetlab-20110303/' + files.pop()
            logging.info('Returning: %s', command)
            return command
    except:
        logging.exception('Exception during request processing:')
        raise


if len(sys.argv) < 2:
    print 'You must specify an argument: a directory containing workload trace files'
    sys.exit(1)

files = os.listdir(sys.argv[1])

logging.info('Starting listening on localhost:8081')
bottle.debug(True)
bottle.run(host='localhost', port=8081, reloader=True)
