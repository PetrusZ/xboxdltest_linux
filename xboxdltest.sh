#!/bin/bash

cd `dirname $0`
source scripts/var.sh

SERVERLIST="lists/server.list"
DNSMASQ="dnsmasq脚本[搜索].txt"
MERLIN="merlin命令[搜索].txt"

for dns in `cat $DNSLIST`
do
nslookup $FQDN. $dns | grep -v $dns | grep -o "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}" >> $TEMPLIST
sort -n $TEMPLIST | uniq > $SERVERLIST
done

echo "找到如下下载服务器"
cat $SERVERLIST

source scripts/speedtest.sh

echo "请从 ${DNSMASQ} 中复制番茄/DD-WRT等可用的dnsmasq脚本，从 ${MERLIN} 中复制Merlin自制系统可用的指令"
