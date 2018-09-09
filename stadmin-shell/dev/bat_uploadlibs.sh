#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

for host in ${hostjq_keyin[*]}
do
	
	echo "=====开始上传libs至内网服务器：${host}"
	ssh tomcat@${cmdhost_keyout} "scp -r ./${prjName}_libs/ tomcat@${host}:/usr/webser/springboot/"
	echo "${host}上传成功"
	
done