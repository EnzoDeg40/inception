# Connect
docker exec -it name /bin/bash

# Remove container
docker rm -f 7450e3e9dba7


# DNS Windows
netsh interface show interface

## For docker
netsh interface ip set dns name="Ethernet" source=static addr=0.0.0.0
netsh interface ip add dns name="Ethernet" addr=1.1.1.1 index=2

## Reset
netsh interface ip set dns name="Ethernet" source=static addr=1.1.1.1
netsh interface ip add dns name="Ethernet" addr=8.8.8.8 index=2

## Show
ipconfig /all
