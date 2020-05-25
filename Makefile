# Makefile to build the command lines and tests in this project.
# This Makefile doesn't consider Windows Environment. If you use it in Windows, please be careful.

SHELL := /bin/bash

#BASEDIR = $(shell pwd)
BASEDIR = $(dir $(realpath $(firstword $(MAKEFILE_LIST))))

# add following lines before go build!
versionDir = github.com/xwi88/version

gitBranch = $(shell git symbolic-ref --short -q HEAD)

ifeq ($(gitBranch),)
gitTag = $(shell git describe --always --tags --abbrev=0)
endif

buildTime = $(shell date "+%FT%T%z")
gitCommit = $(shell git rev-parse HEAD)
gitTreeState = $(shell if git status|grep -q 'clean';then echo clean; else echo dirty; fi)

# -ldflags flags accept a space-separated list of arguments to pass to an underlying tool during the build.
ldflagsDebug="-X ${versionDir}.gitBranch=${gitBranch} -X ${versionDir}.gitTag=${gitTag} \
 -X ${versionDir}.buildTime=${buildTime} -X ${versionDir}.gitCommit=${gitCommit} \
 -X ${versionDir}.gitTreeState=${gitTreeState}"

# -s -w
ldflagsRelase="-s -w -X ${versionDir}.gitBranch=${gitBranch} -X ${versionDir}.gitTag=${gitTag} \
  -X ${versionDir}.buildDate=${buildDate} -X ${versionDir}.gitCommit=${gitCommit} \
  -X ${versionDir}.gitTreeState=${gitTreeState}"

#buildTags=""
buildTags="jsoniter"

.PHONY: version version-darwin version-linux api

defualt: version api

all: version api

clean:
	rm -r build/bin
# cmd section: version
version:
	go build -v -tags ${buildTags} -ldflags ${ldflagsDebug} -o ./build/bin/version ./cmd/version
	@echo "Done version built remain gdb info"
version-run:
	./build/bin/version version
version-darwin:
	export CGO_ENABLED=0 && export GOOS=darwin && export GOARCH=amd64 && \
	go build -v -tags ${buildTags} -ldflags ${ldflagsDebug} -o ./build/bin/version-darwin ./cmd/version
	@echo "Done version built for darwin, remain gdb info "
version-linux:
	export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=amd64 && \
	go build -v -tags ${buildTags} -ldflags ${ldflagsRelase} -o ./build/bin/version-linux ./cmd/version
	@echo "Done version built for linux"

# cmd section: api
api:
	go build -v -tags ${buildTags} -ldflags ${ldflagsDebug} -o ./build/bin/api ./cmd/api
	@echo "Done api built remain gdb info"
api-darwin:
	export CGO_ENABLED=0 && export GOOS=darwin && export GOARCH=amd64 && \
	go build -v -tags ${buildTags} -ldflags ${ldflagsDebug} -o ./build/bin/api-darwin ./cmd/api
	@echo "Done api built for darwin, remain gdb info "
api-linux:
	export CGO_ENABLED=0 && export GOOS=linux && export GOARCH=amd64 && \
	go build -v -tags ${buildTags} -ldflags ${ldflagsRelase} -o ./build/bin/api-linux ./cmd/api
	@echo "Done api built for linux"
api-version:
	./build/bin/api version
api-run:
	./build/bin/api start
api-run2:
	go run ./cmd/api/main.go
