#!/bin/bash
#
# This script should be made executable
# and called in /etc/rc.local
# by the desired user:
#
# su charles -c '/path/to/script'

# remove crusty processes
docker ps -qa | xargs -I% docker rm -f % 

sleep 5;

# run mongodb
${HOME}/codes/docker/d-mongodb/run_mongodb.sh

sleep 5;

# run mongo express
${HOME}/codes/docker/d-mongoexpress/run_stock.sh

