#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

for host in ${hostjq_keyin[*]}
do
	
	echo "=====开始上传${warName}至内网服务器：${host}"
	ssh tomcat@${cmdhost_keyout} "scp /usr/webser/springboot/${warName}  ${user}@${host}:/usr/webser/springboot/"
	echo "${host}上传成功"

done

