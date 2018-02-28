#!/bin/bash
# 
# Run the docker container
# 
# Input traffic only, via specified port.
# Mount volume being synced, too: /opt/mongodb
#
# Can bind the interface to an IP at the docker layer:
#
#     -p <bind-ip>:27017:27017
#
# http://charlesreid1.com/wiki/Docker/Basics

HOSTIP="10.6.0.2"

debug=false
#debug=true

docker ps -qa | xargs docker rm

if [ "$debug" == true ]; then

    docker run \
        --rm \
        --name happy_mongo \
        -p ${HOSTIP}:27017:27017 \
        -v /opt/mongodb:/data \
        -ti jupitermongo \
        /bin/bash

else

    docker run \
        --rm \
        --name happy_mongo \
        -p ${HOSTIP}:27017:27017 \
        -v /opt/mongodb:/data \
        -d \
        -ti jupitermongo 

fi

