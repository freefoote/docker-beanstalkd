Beanstalkd Dockerfile with binlog persistence
=============================================

This is a simple Dockerfile to use the version of Beanstalkd
packaged with Ubuntu 14.04, with a volume to store the binlog.

The primary use for this is as an image for a Dokku plugin.

Running
-------

Simple case to get up and running:

    $ docker run -p 11300:11300 freefoote/beanstalkd

Using a local persistent directory:

    $ docker run -p 11300:11300 \
    -v `pwd`/data:/binlog \
    freefoote/beanstalkd

Addtional command line options (-p and -b are already set,
and this example causes Beanstalkd to fsync for every put):

    $ docker run -p 11300:11300 \
    -e "ADDITIONAL_OPTIONS=-f0" \
    freefoote/beanstalkd

Building
--------

    $ docker build -t freefoote/beanstalkd .

