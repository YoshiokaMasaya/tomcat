FROM java:6b35-jdk

MAINTAINER mozuku<yoshioka@2dfacto.co.jp>

# proxy
ENV http_proxy http://172.17.192.16:8080/
ENV https_proxy http://172.17.192.16:8080/

RUN apt-get update -y && apt-get install -y wget

# create tomcat user
RUN useradd -s /sbin/nologin tomcat

# download and extract tomcat module (change output.)
RUN wget http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.35/bin/apache-tomcat-6.0.35.tar.gz
RUN tar -zxvf apache-tomcat-6.0.35.tar.gz
RUN mv apache-tomcat-6.0.35 /opt/tomcat6_0_35
RUN rm -i apache-tomcat-6.0.35.tar.gz

RUN ln -s /opt/tomcat6_0_35 /opt/tomcat

# make log directory
RUN mkdir /var/log/tomcat

# change locale
ENV LANG ja_JP.UTF-8
ENV LC_ALL ja_JP.UTF-8

# add files
ADD ./opt/tomcat6_0_35/bin/setenv.sh /opt/tomcat6_0_35/bin/setenv.sh

# change permission 
RUN chown tomcat:tomcat /opt/tomcat6_0_35/
RUN chmod 755 /opt/tomcat/bin/setenv.sh

# change memory options
RUN sed ""

CMD ["/opt/tomcat6_0_35/bin/catalina.sh", "run"]