#!/bin/sh
echo "!!!! Start deploy "


cd ./dev/

./ready-deploy.sh

./uploadwar.sh
#./uploadlibs.sh
sleep 1
./uploadconf.sh
./mvckillsimple.sh
sleep 3
./mvcstart_400.sh

./uploadstatic.sh
sleep 2
./mvcstatus.sh