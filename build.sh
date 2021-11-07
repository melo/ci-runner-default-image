#!/bin/sh

set -e

docker build --pull -t melopt/ci-runner-default-image . 
docker push melopt/ci-runner-default-image
