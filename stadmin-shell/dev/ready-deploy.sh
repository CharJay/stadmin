#!/bin/sh
echo "!!!! Start shell "

source ./allconfig.cfg

################################
for ins in ${otherIns[*]}
do
	mvn -f ${ins} install -Dmaven.test.skip=true 
done
mvn -f ${root}/pom.xml install -Dmaven.test.skip=true 

################################
if [ -d "../${fileType}" ]; then
	echo "文件夹${fileType}已存在"
else
	mkdir ../${fileType}
fi

rm -rf ../${fileType}/${prjName}.jar
cp -rf  ${root}/${prjName}-mvc/target/${prjName}*.jar  ../${fileType}/${prjName}.jar

################################