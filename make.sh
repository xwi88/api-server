#!/bin/bash

# absolute path
current_path=$(
    cd $(dirname "${BASH_SOURCE[0]}")
    pwd
)

script_file=$(basename $0)
echo "current script location: $current_path"
echo "current script filename: $script_file"

#设置运行环境
env_support_array=("dev" "uat" "prod")

ENV=$1
DEFAULT_ENV="dev"
current_path=$(cd `dirname $0`; pwd)

# echo -e "choose env, you want to use: dev|test|production default(dev)"
# read -p "Please input a env:" INPUT_ENV
if [[ ${ENV} == "" ]]; then
    ENV=${DEFAULT_ENV}
fi

validCount=0
for element in ${env_support_array[@]}
do
if [[ "${element}" ==  ${ENV} ]]; then
    ((validCount++))
fi
done

if [[ ${validCount} == "0" ]]; then
    echo "env输入错误: ${ENV} not exist in ${env_support_array[@]}"
    exit 0
fi

echo -e "choose env: ${ENV}"

confDir="${current_path}/profiles/${ENV}"
if [[ ! -d "${confDir}" ]]; then
	echo "confDir 不存在"
    exit 0
fi

rm -rf ${current_path}/dist/*
mkdir -p ${current_path}/dist/{bin,conf,log}

if [[ "`ls -A ${confDir}`" = "" ]]; then
  echo "${confDir} 不存在配置文件"
else
    #拷贝配置文件
    cp -r ${current_path}/profiles/${ENV}/* ${current_path}/dist/conf
    #拷贝启动脚本
#    cp -r ${current_path}/scripts/${ENV}/startup.sh ${current_path}/dist/bin
fi

#设置可执行权限
#chmod +x ${current_path}/dist/bin/startup.sh
