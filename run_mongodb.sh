#!/bin/sh
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
	echo "specify a port number for mongodb to open:"
	echo ""
	echo "        ./run_mongodb.sh 27017"
	echo ""
}


# This doesn't care if you don't give it a port number.
# Change this code if you want to specify the MongoDB port number.
if [[ 1==1 || "$#" -ne 1 || $1 =~ "[0-9]\{1,5\}" ]];
then
	usage
else

	docker run \
		--network=host \
		-p 27017:27017 \
		-v /opt/mongodb:/data/db \
		-d \
		-ti cmr_mongodb2 

	# Add this to expose the web interface for MongoDB
	# (also update the Dockerfile):
		#-p 28017:28017 \
fi
