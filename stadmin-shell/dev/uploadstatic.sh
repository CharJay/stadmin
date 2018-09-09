#!/bin/sh
echo "!!!! Start "

source ./allconfig.cfg

for host in ${hostjq[*]}
do

	echo "=====开始执行资源文件部署至服务器：${host}:${priName}"
	
	host=${host}
	user=tomcat
	
	echo "${user}@${host}, location_static_path: ${location_static_path}"
	
	cd ${location_static_path}
	
	zip -r ${priName}.zip ./*
	echo "删除原有zip，并上传zip包到服务器"
	ssh ${user}@${host} "pwd"
	ssh ${user}@${host} "rm ${priName}.zip"
	scp ${priName}.zip ${user}@${host}:~/${priName}.zip
	
	echo "解压新zip包到指定static位置"
	ssh ${user}@${host} "rm -rf ${static_path}/*"
	ssh ${user}@${host} "unzip -oq ~/${priName}.zip -d ${static_path}/"
	rm -rf ${priName}.zip
	
	echo "!!!! done upload-static"

done



