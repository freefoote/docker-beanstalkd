#!/bin/bash

set -e

chown beanstalkd.beanstalkd /binlog

if [ -z "$FSYNCINTER" ]; then
	FSYNCINTER=0
fi

/usr/bin/beanstalkd -p 11300 -b /binlog -u beanstalkd -f$FSYNCINTER $ADDITIONAL_OPTIONS
