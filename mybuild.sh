#!/bin/bash

github_token=""

project="Jrohy/webssh"

#获取当前的这个脚本所在绝对路径
shell_path=$(cd `dirname $0`; pwd)

version=1.27
now=`TZ=Asia/Shanghai date "+%Y%m%d-%H%M"`
go_version=`go version|awk '{print $3,$4}'`
git_version=
ldflags="-w -s -X 'main.version=$version' -X 'main.buildDate=$now' -X 'main.goVersion=$go_version' "
#-X 'main.gitVersion=$git_version'

#GOOS=windows GOARCH=amd64 go build -ldflags "$ldflags" -o result/webssh_windows_amd64.exe .
#GOOS=windows GOARCH=386 go build -ldflags "$ldflags" -o result/webssh_windows_386.exe .
GOOS=linux GOARCH=amd64 go build -ldflags "$ldflags" -o result/webssh_linux_amd64 .
#GOOS=linux GOARCH=arm64 go build -ldflags "$ldflags" -o result/webssh_linux_arm64 .
#GOOS=darwin GOARCH=amd64 go build -ldflags "$ldflags" -o result/webssh_darwin_amd64 .
#GOOS=darwin GOARCH=arm64 go build -ldflags "$ldflags" -o result/webssh_darwin_arm64 .

