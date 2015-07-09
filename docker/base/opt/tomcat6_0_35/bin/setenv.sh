#!/bin/sh

JAVA_HOME=/usr/java/default
CATALINA_OUT=/var/log/tomcat/catalina.out_apkanri
CLASSPATH=${CLASSPATH}:/usr/lib/jmagick-6.4.0.jar

export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/lib64
export JAVA_OPTS="$JAVA_OPTS -Xms2048m -Xmx2048m -XX:PermSize=512m -XX:MaxPermSize=768m -XX:NewSize=1024m -XX:MaxNewSize=1024m "