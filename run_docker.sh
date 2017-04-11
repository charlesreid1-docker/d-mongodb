#!/bin/sh
# 
# Run the docker container
# 
# http://charlesreid1.com/wiki/Docker/Basics

docker run \
	--network=host \
	-p 28017:28017 \
	-p 27017:27017 \
	-v /opt/mongodb:/data/db \
	-ti cmr_mongodb2 

