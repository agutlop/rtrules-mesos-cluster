#!/bin/bash
cd $HOME
git clone https://github.com/mesos/kafka mesoskafka
cd mesoskafka
./gradlew jar
wget https://archive.apache.org/dist/kafka/0.8.2.2/kafka_2.10-0.8.2.2.tgz
cp /vagrant/config/kafka-mesos.properties .
cp /vagrant/scripts/kafka-mesos.sh .

