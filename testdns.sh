#!/bin/bash

cd `dirname $0`
source scripts/var.sh

for i in `cat $DNLIST`
do
    echo Xbox One下载服务域名【$i】会被默认DNS服务器解析为如下IP地址：
    nslookup $i | grep -i address | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" | sed 1d
done
