#!/bin/sh
# 
# Run the docker container
# 
# http://charlesreid1.com/wiki/Docker/Basics

docker run \
	-p 28017:28017 \
	-p 27017:27017 \
	-v /opt/mongodb:/data/db \
	-d \
	-ti cmr_mongodb2 

