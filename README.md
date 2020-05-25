# API-Server

>Simple api server for studying

## Feature

- [x] [dev env set](doc/dev_env_set.md)
- [x] [base dir structure](doc/base_dir_structure.md)
- [x] import cli & config pkg: **cobra** and *viper*, use config pkg wrapper [config4go](https://github.com/xwi88/config4go.git).
- [x] Makefile with partial build arguments
    - cross compile
    - mod: `go build -mod=vendor`
    - tags: a comma-separated list of build tags.
- [x] [type alias](doc/type_alias.md)
- [ ] config option pattern
- [ ] simple http server
    - [ ] data structure: byte, int, float, string, rune, slice, map, chan, etc.
    - [x] field tag: `json, xml, orm, etc`. **Use with reflect.**
    - [x] [byte alignment](doc/byte_alignment.md)
    - [ ] struct & interface & reflect(option)
    - [ ] for & for range & goto label
    - [ ] goroutine
    - [ ] closure
    - [x] internal dir
    - [x] related specification: Plz watch each file and their comments and can ref [uber_go_guide_cn](https://github.com/xxjwxc/uber_go_guide_cn).
    - [x] http server
    - [ ] test & benchmark
- [x] go cmd: build & run & others
- [x] vendor: project pkg dir, should not use, if u want, `go build -mod=vendor`.
- [ ] add version info
    - [x] code version
    - [ ] API version: tag/branch/version file
- [ ] proto
    - [ ] idl define
    - [ ] proto generate
- [ ] simple rpc server & client
- [x] Dockerfile
- [x] multi env support: profiles dir, default dev
- [x] [go web framework](doc/go_framework.md)

## TODO

- [ ] restart & hot reload
- [ ] swagger api
- [ ] chan pattern
- [ ] metrics
    - [ ] grafana & prometheus
    - [ ] metrics
    - [ ] metrics api: new port
- [ ] JWT(JSON Web Token)
- [ ] http rateLimit & interceptor
- [ ] Web ASM
- [ ] pprof
- [ ] design pattern
    - [ ] singleton
