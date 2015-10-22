Beanstalkd Dockerfile with binlog persistence
=============================================

This is a simple Dockerfile to use the version of Beanstalkd
packaged with Ubuntu 14.04, with a volume to store the binlog.

The primary use for this is as an image for a Dokku plugin.

I've chosen to make Beanstalkd fsync after each put. This may
impact the performance depending on your use case and load.
When starting, set the environment variable FSYNCINTER to an
integer value in milliseconds, and that will be used instead.

Running
-------

Simple case to get up and running:

    $ docker run -d -p 11300:11300 freefoote/beanstalkd

Using a local persistent directory:

    $ docker run -d -p 11300:11300 \
    -v `pwd`/data:/binlog \
    freefoote/beanstalkd

Addtional command line options (-p and -b are already set,
and this example causes Beanstalkd to emit more verbose messages):

    $ docker run -d -p 11300:11300 \
    -e "ADDITIONAL_OPTIONS=-V" \
    freefoote/beanstalkd

Building
--------

    $ docker build -t freefoote/beanstalkd .

