curl -X POST http://192.168.33.10:8080/v2/apps -d @/vagrant/marathon-apps/mesos-dns.json -H "Content-type: application/json"
curl -X POST http://192.168.33.10:8080/v2/apps -d @/vagrant/marathon-apps/kafka-scheduler.json -H "Content-type: application/json"
curl -X POST http://192.168.33.10:8080/v2/apps -d @/vagrant/marathon-apps/spark-dispatcher.json -H "Content-type: application/json"