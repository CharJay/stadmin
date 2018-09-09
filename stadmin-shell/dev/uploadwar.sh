#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

hostlist=${hostjq[*]}
if [ ! -n "$1" ] ;then
	echo ""
else
	echo "kill特定的host: $1" 
	hostlist=("$1")
fi

for host in ${hostlist}
do

	echo "=====开始上传${prjName}至部署服务器：${host}"
	
	echo "------上传文件"
	scp  ../jar/${prjName}.${fileType}  ${user}@${host}:~/

	echo "-------删除旧jar 移入新jar"
	echo "删除旧jar ${prjName}"
	ssh tomcat@${host} "rm -rf /usr/webser/springboot/${prjName}.jar"
	
	echo "移入新jar ${prjName}"
	
	ssh tomcat@${host} "cp -rf ~/${prjName}.jar -d /usr/webser/springboot/${prjName}.jar"
	
	echo "-------成功"
done


