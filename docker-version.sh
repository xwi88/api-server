#!/usr/bin/env bash

tagVersion=1.0.0

domain=example.com/

#规则 组名-项目名|api-server
imageRep=${domain}backend/api-server

tagName=${imageRep}:${tagVersion}
