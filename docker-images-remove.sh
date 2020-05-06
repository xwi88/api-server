#!/usr/bin/env bash

docker rmi -f $(docker images | awk '$1 == "<none>" && $2 == "<none>" {print $3}')
