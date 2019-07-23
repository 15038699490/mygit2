FROM registry.cn-zhangjiakou.aliyuncs.com/away/repositories:v1

MAINTAINER Weber boy
#install java
#RUN yum -y install java
ADD ./jdk-7u79-linux-x64.tar.gz /root
#ADD ./ecf.platform.web-0.0.1-SNAPSHOT.jar /apps/svr/
#ADD ./start.sh /apps/svr/
##set environment variable
ENV JAVA_HOME /root/jdk1.7.0_79
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $JAVA_HOME/bin:$PATH
#set charset
ENV LANG "zh_CN.UTF-8"
#inatall app 
EXPOSE 80 443 8082
VOLUME ["/apps/logs/","/apps/svr/"]
#start app
CMD echo "start app ..."
#ENTRYPOINT java -jar /apps/svr/ecf.platform.web-0.0.1-SNAPSHOT.jar --server.port=8082 --spring.profiles.active=sit 
ENTRYPOINT /apps/svr/start.sh
CMD echo "started app success"