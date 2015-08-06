#!/bin/bash

echo ...Stopping Kafka...
kafka-server-stop 

echo ...Stopping Schema Registry...
schema-registry-stop 

echo ...Stopping Kafka REST Proxy...
kafka-rest-stop 

echo ...Stopping Zeppelin...
$ZEPPELIN_HOME/bin/zeppelin-daemon.sh stop 

echo ...Stopping Spark Master...
$SPARK_HOME/sbin/stop-master.sh --webui-port 6060 

echo ...Stopping Spark Worker...
$SPARK_HOME/sbin/stop-slave.sh --webui-port 6061

echo ...Stopping Spark JDBC ODBC Hive ThriftServer...
$SPARK_HOME/sbin/stop-thriftserver.sh  

echo ...Stopping ZooKeeper...
zookeeper-server-stop 

echo ...Stopping Spark-Notebook...
screen -X -S "snb" quit && rm -rf $DEV_INSTALL_HOME/spark-notebook-0.6.0-scala-2.10.4-spark-1.4.1-hadoop-2.6.0-with-hive-with-parquet/RUNNING_PID

echo ...Stopping Cassandra...
pkill -f CassandraDaemon 

echo ...Stoppig SSH...
service ssh stop

echo ...Stopping MySQL...
service mysql stop
