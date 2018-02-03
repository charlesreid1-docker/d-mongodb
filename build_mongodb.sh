#!/bin/bash
#
#################################
# 
# DO NOT CALL THIS SCRIPT DIRECTLY.
# 
# use the Makefile.
# 
#################################
# 
# Build the mongodb docker container using the Dockerfile
# 
# https://charlesreid1.com/wiki/Docker/Dockerfiles

function usage {
    echo ""
    echo "build_mongodb.sh script:"
    echo "builds a MongoDB docker container."
    echo ""
    echo "        ./build_mongodb.sh"
    echo ""
}

if [[ "$#" -ne 0 ]];
then
    usage
else

    docker build -t jupitermongo .

fi
