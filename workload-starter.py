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
    filename='workload-starter.log',
    format='%(asctime)s %(levelname)-8s %(message)s',
    level=logging.DEBUG)

import sys
import time
import requests


if len(sys.argv) < 3:
    print 'You must specify 2 arguments:'
    print '1. The address of the server'
    print '2. The time interval between requests to the server in seconds'
    sys.exit(1)

server = sys.argv[1]
interval = int(sys.argv[2])
logging.info('Initialized the parameters: ' + server + ', ' + str(interval))

while True:
    logging.info('Sending a request to the server')
    r = requests.get(server)
    logging.info('Received a reply from the server: ' + str(r))
    time.sleep(interval)
