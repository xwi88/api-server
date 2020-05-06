# Base project dir structure

```text
┌── build:              build dir
    |__ bin:            make 生成的二进制文件存放目录
|__ cmd:                cli dir
    |__ api:            api server
        |__ handler:    http handler
        |__ internal:   api cmd use modules
        |__ main.go:    main pkg
    |__ version:        version bin
        |__ main.go     main pkg
    |__ version.go:     项目版本信息 cmd, 公用
|__ dist:               生成部署所需配置及脚本存储位置-容器服务
|__ docs:               相关文档存储
|__ internal:           项目内部公用包，可提取为公用包
     |__ platform:      基础组件
          |__ constant: 常量
          |__ crypto:   加解密安全相关
          |__ database: 数据库存储相关
          |__ utils:    工具类
|__ log:                日志目录，git ignore
|__ profiles:           部署所需配置文件存放目录
    |__ dev:            研发环境配置目录
    |__ prod:           线上环境配置目录
    |__ qa:             测试环境配置目录
|__ scripts:            部署所需脚本-容器服务
|__ vendor:             依赖包 vendor
|__ Dockerfile:         for build docker image, 请勿修改
|__ go.mod:             go module 配置文件，请勿修改
|__ Makefile:           make 命令使用
```
