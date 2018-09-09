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

	echo "=====开始上传配置${prjName}：${host}"
	scp -r ./${prjName}_conf/ tomcat@${host}:/usr/webser/springboot/
	
done
