# RTRules Mesos Cluster

Cluster de Mesos para probar los jobs de Spark Streaming para el proyecto fin de master del Experto en Big Data de la U-Tad Curso 2015-2016

## Resumen

Este cluster será desplegado mediante Vagrant y estará formado por 4 máquinas virtuales con las siguientes carácteristicas:
* Máquinas de 64 bits
* 3Gb de RAM
* 2 cores
* 40Gb de Disco
* S.O. Centos 7.1

Mediante Ansible, se aprovisionará el cluster con todo el software necesario para la ejecución de los jobs de Spark Streaming, así como para la creación de las colas Kafka.

## Prerrequisitos

Para el correcto funcionamiento del Cluster se recomienda tener como mínimo 16Gb de memoria RAM y un procesador Octacore.
Es necesario tener instalados los siguientes programas para poder desplegar el cluster:
* Vagrant 1.8.4 (https://www.vagrantup.com/)
* VirtualBox 5.0.26

No es necesario instalar Ansible, pues el aprovisionamiento se lanzará desde los nodos.

Para levantar el cluster será necesario descargar el repositorio https://github.com/agutlop/rtrules-mesos-cluster y, una vez en la ruta del proyecto, lanzar vagrant:

`vagrant up`


## Descripcion del Cluster

El cluster crea una red con los siguietnes nodos e IPs:
* nodo1: 192.168.33.10
* nodo2: 192.168.33.11
* nodo3: 192.168.33.12
* nodo4: 192.168.33.13
* PC Anfitrión: 192.168.33.1

El nodo1 hará las funciones de Master para la mayoría de las aplicaciones

## Software provisionado

El aprovisionamiento se hará mediante Ansible. Todos los pasos para el aprovisionamiento se pueden consultar en el fichero `playbook.yml`
El software es el siguiente:
* **Master (nodo1)**
  * Ansible
  * Zookeeper
  * Mesos Master y Slave
  * Marathon
  * Chronos
  * mesos-dns (https://github.com/mesosphere/mesos-dns)
  * Scala 2.11.8
  * Spark-2.0.0 para Hadoop 2.6
  * Mesos Kafka (https://github.com/mesos/kafka)
 
* **Slaves (nodos del 2 al 3)**
  * Ansible
  * Mesos Slave
  * Scala 2.11.8
  * Spark-2.0.0 para Hadoop 2.6

Se levantaran los siguientes servicios al arrancar el cluster:
* Zookeeper
* Mesos master y mesos slave
* Marathon
* Chronos

Se crearán las siguientes aplicaciones en Marathon:
* Mesos-dns
* Kafka Schedulr
* Spark Dispatcher

Se creará un broker de kafka y los siguientes topics para poder lanzar los programas de ejemplo de Spark Streaming:
* topic-wordapp
* topic-wordcount
* topic-meetuprsvp

## UIs de los servicios levantados

Se puede comprobar el correcto funcionamiento del cluster mediante las interfases de usuario de los distintos componentes. A continuación se listan las direcciones de los distintos UIs de los servicios instalados:
* Mesos: 192.168.33.10:5050
* Marathon: 192.168.33.10:8080
* Spark Dispatcher: 192.168.33.10:8081

Así mismo, para comprobar que las colas kafka se han creado correctamente, se puede lanzar el siguiente script:
* `$HOME/mesoskafka/kafka-mesos.sh broker list`
* `$HOME/mesoskafka/kafka-mesos.sh topic list`

Para ello, será necesario conectarse mediante ssh al nodo1, pues es el que contiene la instalacion de mesos-kafka:

`vagrant ssh node1`














    
