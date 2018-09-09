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

	echo "=====开始启动${warName} 服务器：${host}"
	ssh tomcat@${host} "nohup /usr/java/jdk1.7.0_71/bin/java -server -Xms1024m -Xmx1024m -XX:NewSize=512m -XX:MaxNewSize=512m -XX:PermSize=128m -XX:MaxPermSize=256m -Xss256k -Dloader.path=/usr/webser/springboot/${prjName}_libs/ -jar /usr/webser/springboot/${prjName}.jar --spring.config.location=/usr/webser/springboot/${prjName}_conf/application.properties --spring.profiles.active=pro > /dev/null 2>&1 &"
	echo "-------启动成功"

done
