#!/bin/bash

set -e

/usr/bin/beanstalkd -p 11300 -b /binlog $ADDITIONAL_OPTIONS
