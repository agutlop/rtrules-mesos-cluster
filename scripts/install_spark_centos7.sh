#!/bin/bash
# Install Spark on CentOS 7
sudo yum install java -y
java -version

cd $HOME

#yum install wget -y
wget http://downloads.typesafe.com/scala/2.11.8/scala-2.11.8.tgz

#cp /vagrant/resources/scala-2.11.8.tgz $HOME/scala-2.11.8.tgz
tar xvf scala-2.11.8.tgz
sudo mv scala-2.11.8 /usr/lib
sudo ln -s /usr/lib/scala-2.11.8 /usr/lib/scala
export PATH=$PATH:/usr/lib/scala/bin
scala -version

wget http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.6.tgz
#cp /vagrant/resources/spark-2.0.0-bin-hadoop2.6.tgz $HOME/spark-2.0.0-bin-hadoop2.6.tgz
tar xvf spark-2.0.0-bin-hadoop2.6.tgz

export SPARK_HOME=$HOME/spark-2.0.0-bin-hadoop2.6
export PATH=$PATH:$SPARK_HOME/bin

echo 'export PATH=$PATH:/usr/lib/scala/bin' >> .bash_profile
echo 'export SPARK_HOME=$HOME/spark-2.0.0-bin-hadoop2.6' >> .bash_profile
echo 'export PATH=$PATH:$SPARK_HOME/bin' >> .bash_profile

#copiamos el jar de Elastic Search
cd $SPARK_HOME/jars
cp /vagrant/libs/elasticsearch-spark-20_2.11-5.0.0-alpha5.jar .

cd $SPARK_HOME/conf
cp /vagrant/config/spark-env.sh .
cp /vagrant/config/spark-defaults.conf .

#configuramos la ip del nodo
CURRENT_IP=$(hostname -i)
echo SPARK_LOCAL_IP=$CURRENT_IP >> spark-env.sh