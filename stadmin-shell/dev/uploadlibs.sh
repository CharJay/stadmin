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
	
	echo "=====开始上传libs ${prjName}：${host}"
	ssh tomcat@${host} "mkdir /usr/webser/springboot/"
	scp -r ./${prjName}_libs/ tomcat@${host}:/usr/webser/springboot/
	echo "====上传libs success"
	
done