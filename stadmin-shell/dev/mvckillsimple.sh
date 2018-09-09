#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

hostlist=${hostjq[*]}
if [ ! -n "$1" ] ;then
	echo ""
else
	echo "特定的host: $1" 
	hostlist=("$1")
fi

for host in ${hostlist}
do
	
	echo "kill ${prjName}至 服务器 $host"
	pid=$(ssh root@${host} "ps -ef | grep ${prjName} | grep -v grep | awk  '{print $2}'"| awk '{print $2}')
	ssh root@${host} "kill -9 ${pid}"
	echo "====kill success!"
	
done