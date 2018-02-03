#!/bin/bash
# 
# Run the docker container
# 
# Input traffic only, via specified port.
# Mount volume being synced, too: /opt/mongodb
# 
# http://charlesreid1.com/wiki/Docker/Basics

function usage {
    echo ""
    echo "run_mongodb.sh script:"
    echo "run the mongodb docker container."
    echo ""
    echo "        ./run_mongodb.sh"
    echo ""
}

debug=false
#debug=true

if [ "$debug" == true ]; then

    docker run \
        --name happy_mongo \
        -p 27017:27017 \
        -v /opt/mongodb:/data \
        -ti jupitermongo \
        /bin/bash

else

    docker run \
        --name happy_mongo \
        -p 27017:27017 \
        -v /opt/mongodb:/data \
        -d \
        -ti jupitermongo 

fi

#    -d \
#    --network=host \
#    -p 10.6.0.1:27017:27017 \
#    -p 127.0.0.1:27017:27017 \

# Add this to expose the web interface for MongoDB
# (also update the Dockerfile):
#-p 28017:28017 \

