#!/bin/bash

cd `dirname $0`
source scripts/var.sh

SERVERLIST="lists/unicom.list"
DNSMASQ="dnsmasq脚本[联通].txt"
MERLIN="merlin命令[联通].txt"

echo "正在测试所有已知的中国联通下载服务器..."

source scripts/speedtest.sh

echo "请从 ${DNSMASQ} 中复制番茄/DD-WRT等可用的dnsmasq脚本，从 ${MERLIN} 中复制Merlin自制系统可用的指令"
