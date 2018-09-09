#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

for host in ${hostjq_keyin[*]}
do
	
	echo "=====开始创建文件夹至内网服务器：${host}"
	ssh tomcat@${cmdhost_keyout} "ssh ${user}@${host} mkdir /usr/webser/springboot/"
	echo "${host}创建文件夹成功"

done

