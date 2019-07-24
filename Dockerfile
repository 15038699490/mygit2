#基于centos镜像
FROM registry.cn-zhangjiakou.aliyuncs.com/away/repositories:5.1.5

#维护人的信息
MAINTAINER The CentOS Project Weber boy <15038699490@163.com>

COPY ./jdk-8u11-linux-x64.tar.gz /usr/local
COPY ./apache-tomcat-9.0.19.tar.gz /usr/local
COPY ./apache-maven-3.6.1-bin.tar.gz /usr/local

ENV M2_HOME=/usr/local/apache-maven-3.6.1
ENV JAVA_HOME /usr/local/jdk1.8.0_11
ENV JRE_HOME $JAVA_HOME/jre  
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib  
ENV PATH $PATH:$JAVA_HOME/bin
ENV PATH $PATH:$M2_HOME/bin
ENV CATALINA_OPTS -Xms128m -Xmx1024m -XX:PermSize=64M -XX:MaxPermSize=512M
RUN cd /usr/local/apache-tomcat-9.0.19/logs && echo "1" >>count.txt
ENTRYPOINT /usr/local/apache-tomcat-9.0.19/bin/startup.sh && tail -F /usr/local/apache-tomcat-9.0.19/logs/catalina.out