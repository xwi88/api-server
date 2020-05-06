#!/usr/bin/env bash

function echo_red(){
    local str_info=$@
    echo -e "\033[31m $str_info \033[0m"
    return 0
}

source ./docker-version.sh

ENV=$1
echo -e "docker build info: ENV: ${ENV}, Tag: ${tagName}"
if [[ ${ENV} == "" ]]; then
    echo_red "please specify the env for ${tagName}"
    exit 0
fi

source ./make.sh

#docker rmi -f ${tagName}

docker build -t ${tagName}  -f Dockerfile .
