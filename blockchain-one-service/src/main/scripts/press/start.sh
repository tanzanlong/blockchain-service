#!/bin/sh
#变量设置
SERVICE_NAME=acct-customer-service
PROJECT_DIR=$(cd "$(dirname "$0")"; pwd)
PROJECT_DIR=$PROJECT_DIR/..
CONFIG_DIR=$PROJECT_DIR/config
LIB_DIR=$PROJECT_DIR/lib
LIB_JARS=`ls $LIB_DIR | grep .jar | awk '{print "'$LIB_DIR'/"$0}' | tr "\n" ":"`
mkdir -p /logs/$SERVICE_NAME/
MAIN_CLASS="com.baibei.settlement.customer.Bootstrap"
# 设置classpath
#nohup java -classpath $CONFIG_DIR:$LIB_JARS $MAIN_CLASS &
#由于使用docker，所以无法使用nohup  将进程挂起，也不能使用重定向等
#java -Dspring.profiles.active=press -classpath $CONFIG_DIR:$LIB_JARS $MAIN_CLASS

java -Xms1024M -Xmx2048M -Xmn1536M -Xss512k -Denv=fat -Dfat_meta=http://192.168.12.150:1666 -Dapollo.cluster=press -classpath $CONFIG_DIR:$LIB_JARS $MAIN_CLASS | tee -a /logs/$SERVICE_NAME/std_out.log