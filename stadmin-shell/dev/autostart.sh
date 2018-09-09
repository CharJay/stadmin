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

shellcmd="su - tomcat -c \"nohup /usr/java/jdk1.7.0_71/bin/java -Dloader.path=/usr/webser/springboot/${prjName}_libs/ -jar /usr/webser/springboot/${prjName}.jar --spring.config.location=/usr/webser/springboot/${prjName}_conf/application.properties > /dev/null 2>&1 &\""

for host in ${hostlist}
do
	
	echo "=====${prjName}开始设置开机自启动,服务器：${host}"
	ssh root@${host} "echo $shellcmd >> /etc/rc.d/rc.local"
	echo "==设置开机自启动 success"

done