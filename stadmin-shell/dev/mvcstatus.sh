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

	echo "=====查看状态${prjName}至部署服务器：${host}"
	ssh tomcat@$host "ps -ef|grep ${prjName}|grep -v grep|grep -v kill|awk '{print $2}'"
	echo "ok"
	
done