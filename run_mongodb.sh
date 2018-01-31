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


docker run \
    --name happy_mongo \
    -p 192.168.125.28:27017:27017 \
    -p 10.6.0.1:27017:27017 \
    -v /opt/mongodb:/data/db \
    -d \
    -ti jupitermongo

#	--network=host \

# Add this to expose the web interface for MongoDB
# (also update the Dockerfile):
#-p 28017:28017 \

