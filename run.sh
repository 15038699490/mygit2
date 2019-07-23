#!/bin/bash

#清空httpd缓存文件
rm -rf /run/httpd/*

#启动httpd服务
exec /usr/sbin/apachectl -D FOREGROUND