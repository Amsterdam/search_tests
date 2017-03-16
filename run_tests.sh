#!/usr/bin/env bash

set -u
set -e

docker-compose rm tests

docker-compose build

docker-compose run tests ./pyresttest.sh $URL

docker-compose run tests ./robs_tests.py $URL