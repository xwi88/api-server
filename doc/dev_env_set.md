# Base develop environment

## Install

- [download pkg](https://golang.org/dl/)
- [install guide](https://golang.org/doc/install)

### Mac Install

> [brew ref](https://docs.brew.sh/FAQ)

- `brew update`
- `brew install go@1.14`

```bash
#default auto generate!
GOPATH="$HOME/go"
GOROOT="/usr/local/Cellar/go/1.14.2_1/libexec"
GOTOOLDIR="/usr/local/Cellar/go/1.14.2_1/libexec/pkg/tool/darwin_amd64"
```

### Tarballs Install

```bash
tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz

#Add /usr/local/go/bin to the PATH environment variable.
export PATH=$PATH:/usr/local/go/bin
```

### Installing extra Go versions

```bash
go get golang.org/dl/go1.14.1
go1.14.1 download
```

### Uninstalling Go

>remove the bin file and the related ENV set

## Configs

```bash
#enable go module, go1.14 auto enable, no need set!
#export GO111MODULE=on

#use go module, no need set GOPATH
#export GOPATH=$HOME/go
#export PATH=$PATH:$GOPATH

#go bin
export GOBINARY=$HOME/go/bin
export PATH=$PATH:$GOBINARY

# go proxy config
export GOPROXY=https://goproxy.cn,https://goproxy.io,https://proxy.golang.org,direct
```

## IDE

- [ATOM](https://atom.io/)
- [VS Code](https://code.visualstudio.com/) ☆☆☆
- [Goland](https://www.jetbrains.com/go/) ☆☆☆☆☆

## Goland Config

>请进行全局设置

- GOROOT
- GO Modules: 配置代理
- Plugins
  - ignore
  - yaml
  - Protobuf Support
  - Bash Support
  - Makefile Support
  - .env files support
  - Rainbow Brackets
- Code Style
  - Table and Indent: Smart tabs
  - **Imports**
    - [x] Add parentheses for a single import 单行也要圆括号
    - [x] Remove redundant import aliases
    - [x] Sorting type **goimports**
    - [x] Group stdlib imports
      - [x] Move all stdlib imports in a singele group
    - [x] Group current project imports
    - [x] Move all imports in a single declaration
    - 说明: 标准库包, 本地包(不建议)，golang包，初始化包，github
  - Other
    - [x] Add leading space to comments

## Glossary

- **GOROOT**: go 安装位置, 安装后生成或配置
  - src: contains Go source files.
  - bin: contains the binary executables.
    - go
    - godoc
    - gofmt
  - pkg: contains Go package archives (.a). All the non-executable packages (shared libraries) are stored in this directory.
    - tool
    - include
    - darwin_amd64
    - darwin_amd64_race
- **GOPATH**: go1.13 前的默认工作空间，Unix 默认位置 $HOME/go, Windows 默认 %USERPROFILE%\go。go module 下源码无需放置 GOPATH 下。
  - 可配置在文件: ~/.bash_profile or ~/.zshrc
  - 包含目录
    - bin: go get/install 二进制存放位置
    - pkg: 依赖包安装位置
    - 禁止把GOPATH设置成go的安装路径, 默认路径即可!
- **module**: go1.11 推出， go1.13 默认开启
- `go install`: 项目二进制程序安装
  - **GOBIN**
  - **$GOPATH/bin or $HOME/go/bin**
  - *$GOROOT 下的可执行文件在 $GOROOT/bin or $GOTOOLDIR*
  - disabled module, 依赖安装: $GOPATH/pkg/$GOOS_$GOARCH
  - ***enable module, 依赖只是 build and cache, 不安装!***
- `vendor`: 项目依赖存放目录，需借助包管理工具。使用 go module 功能可不配置此目录。
