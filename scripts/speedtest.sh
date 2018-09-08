#!/bin/bash

for server in `cat $SERVERLIST`
do
    echo "######################## ${DATE} ########################" >> "${DNSMASQ}"
    echo "######################## ${DATE} ########################" >> "${MERLIN}"
    echo "测试 $server 的下载速度"
    speed=$(curl -s -o /dev/null -m 10 -r ${RANGE} -y 5 --url "http://$server${URL}" -H "Host: ${FQDN}" -w "%{speed_download}")
    speed=$(echo "scale=3; $speed / 1024" | bc)
    echo "$server 的下载速度为 $speed KB/s"
    echo "#$server's download speed is: $speed KB/s" >> "${DNSMASQ}"
    echo "#$server's download speed is: $speed KB/s" >> "${MERLIN}"

    # dnsmasq
    echo -n "address=/" >> ${DNSMASQ}
    for dn in `cat $DNLIST`
    do
        echo -n "$dn/" >> ${DNSMASQ}
    done
    echo "$server/" >> ${DNSMASQ}
    echo "" >> "${DNSMASQ}"

    # merlin
    echo -n 'kill -9 `cat /var/run/dnsmasq.pid` && dnsmasq --log-async --address=/' >> ${MERLIN}
    for dn in `cat $DNLIST`
    do
        echo -n "$dn/" >> ${MERLIN}
    done
    echo $server >> ${MERLIN}
    echo "" >> ${MERLIN}
done
