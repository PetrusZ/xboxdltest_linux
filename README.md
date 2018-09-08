# Xbox download speedtest tool for linux/unix

Find out which download server ip is best speed for you.

Port from DeLaJSR@TGFC.(Not so sure)

## Usage

`./telecom.sh` for telecom user.

`./unicom.sh` for unicom user.

`./xboxdltest.sh` search all ip address, and test them speeds(experimental).

### dnsmasq

Add config like `address=/assets1.xboxlive.com/assets2.xboxlive.com/"ip"/` to dnsmasq config file.

Replace "ip" to your fastest download speed ip.

### Merlin(Not recommended)

Use ssh to login the router, then use command like ```kill -9 `cat /var/run/dnsmasq.pid` && dnsmasq --log-async --address=/assets1.xboxlive.com/assets2.xboxlive.com/"ip"```

Replace "ip" to your fastest download speed ip.

## How to lookup download servers all ip address

http://site.ip138.com/assets1.xboxlive.com/
http://site.ip138.com/assets2.xboxlive.com/

## TODO

* Find a better way to search all xbox download server ip address.
