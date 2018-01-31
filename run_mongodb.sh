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
	--network=host \
	-p 27017:27017 \
	-v /opt/mongodb:/data/db \
	-d \
	-ti jupitermongo

# Add this to expose the web interface for MongoDB
# (also update the Dockerfile):
#-p 28017:28017 \

