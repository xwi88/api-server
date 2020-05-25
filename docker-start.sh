#!/usr/bin/env bash

source ./docker-version.sh

# absolute path
current_path=$(
    cd $(dirname "${BASH_SOURCE[0]}")
    pwd
)

default_env=dev

script_file=$(basename $0)
echo "current script location: $current_path"
echo "current script filename: $script_file"

CMD=$*
# docker volume need the absolute path
docker run --name api-server --rm \
-p 3701:3701 \
-v ${current_path}/build/docker-test/log:/data1/services/api/log \
-v ${current_path}/build/docker-test/data:/data1/services/api/data \
${tagName}  ${CMD}

#-v ${current_path}/conf/app.yml:/data1/services/app/conf/api.yml \
