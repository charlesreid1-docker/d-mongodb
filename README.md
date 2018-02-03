# d-mongodb

This repo contains files for creating a MongoDB Docker container.

## TL; DR

Run `make`.

## MongoDB Docker Image

This Docker container is based on the image from 
[frodenas on github](https://github.com/frodenas/docker-mongodb/).
The main change is that we are adding a build script and a run script,
and a few tweaks to the Dockerfile.

To get the MongoDB authentication credentials for the docker container,
check the logs using Docker - the credentials are printed to the logs.

```
$ docker logs inspiring_malachai
```

## MongoDB Docker Image

Two scripts do the building and running of the Docker image.
Don't call them directly - use the Makefile.

```
$ make
```

This should bind port 27017 from the host machine 
to port 27017 on the container.

## Building the Docker Container

To build the Docker container, use the Makefile.

The `build_mongodb.sh` script will do the following:
* Build the Docker container using the Dockerfile

## Running the Docker Container

To run the Docker container, use the Makefile.

This script ask you to open the firewall of the machine
running the Docker container to expose the 
container's service to the outside world.

The `run_mongodb.sh` script will do the following:
* Mount /wifi in the host machine to /wifi in the container
* Map port X on the host machine to port X in the container (X is specified as the first command line argument)

## Container Actions

The Dockerfile will do the following:
* Set up MongoDB aptitude repository for MongoDB 3.0
* Mount local `/opt/mongodb` to container `/data/db`

## Test MongoDB

The `test/` directory contains two Python scripts to test out the MongoDB:

```
$ cd test/
$ python test_mongo_insert.py
$ python test_mongo_retrieve.py
```

Run them in that order.

## Notes

* Different versions of MongoDB are located at the github repo [frodenas/docker-mongodb](https://github.com/frodenas/docker-mongodb/branches).

### User Credentials

The first time you run your container,  a new user `mongo` with all privileges will be created with a random password.
To get the password, check the logs of the container by running:

```
docker logs <CONTAINER_ID>
```

You will see an output like the following:

```
========================================================================
MongoDB User: "mongo"
MongoDB Password: "ZMUgiS3O1kJH1ec5"
MongoDB Database: "admin"
MongoDB Role: "dbAdminAnyDatabase"
========================================================================
```

If you want to preset credentials instead of a random generated ones, you can set the following environment variables:

* `MONGODB_USERNAME` to set a specific username
* `MONGODB_PASSWORD` to set a specific password

On this example we will preset our custom username and password:

```
$ docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -e MONGODB_USERNAME=myusername \
    -e MONGODB_PASSWORD=mypassword \
    frodenas/mongodb
```

### Databases

If you want to create a database at container's boot time, you can set the following environment variables:

* `MONGODB_DBNAME` to create a database
* `MONGODB_ROLE` to grant the user a role to the database (by default `dbOwner`)

On this example we will preset our custom username and password and we will create a database with the default role:

```
$ docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -e MONGODB_USERNAME=myusername \
    -e MONGODB_PASSWORD=mypassword \
    -e MONGODB_DBNAME=mydb \
    frodenas/mongodb
```

### Extra arguments

When you run the container, it will start the 
MongoDB server without any arguments. 
If you want to pass any arguments,
just add them to the `run` command:

```
$ docker run \
	-d --name mongodb \
	-p 27017:27017 \
	mongodb \
	--smallfiles
```

### Persistent data

MongoDB will store data in `/data`.
Map `/data` to the host to keep data persistent.

```
$ mkdir -p /tmp/mongodb

$ docker run -d \
    --name mongodb \
    -p 27017:27017 \
    -v /tmp/mongodb:/data \
    mongodb
```



---


# Notes

## A Big Dumb Runaround

I wasted a lot of time trying to debug
a problem I could never quite chase down,
with inconsistent behaviors and contradictory
behavior. 

But once I turned on journaling with the 
--journal flag, that seemed to fix the 
issues.

What I would see was, sometimes starting
the container interactively would go off 
without a hitch, and sometimes it would 
say that localhost port 27017 connection
was refused.

Ultimately this seemed to be a problem
with a lock file (go figure).
Because we have a persistent
data directory, an existing 
lock file was probably screwing
everything up.




