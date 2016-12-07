# docker-alpine-mongo
This is a fork from mvertes

This repository contains Dockerfile for [MongoDB 3.2](https://www.mongodb.org)
container, based on the [Alpine edge](https://hub.docker.com/_/alpine/) image.

Why ? the official mongo image size: 317 MB, alpine-mongo: 78 MB

## Install

As a prerequisite, you need [Docker](https://docker.com) to be installed.

To download this image from the public docker hub:

	$ docker pull njetty/alpine-mongo

To re-build this image from the dockerfile:

	$ docker build -t njetty/alpine-mongo .

## Usage

To run `mongod`:

	$ docker run -d --name mongo -p 27017:27017 njetty/alpine-mongo

You can also specify the database repository where to store the data
with the volume -v option:

    $ docker run -d --name mongo -p 27017:27017 \
	  -v /somewhere/onmyhost/mydatabase:/data/db \
	  njetty/alpine-mongo

To run a shell session:

    $ docker exec -ti mongo sh

To use the mongo shell client:

	$ docker exec -ti mongo mongo

The mongo shell client can also be run its own container: 

	$ docker run -ti --rm --name mongoshell monogo host:port/db

## Limitations

- On MacOSX, volumes located in a virtualbox shared folder are not
  supported, due to a limitation of virtualbox (default docker-machine
  driver) not supporting fsync().
