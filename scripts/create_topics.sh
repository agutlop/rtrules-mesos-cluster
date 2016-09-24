cd $HOME/mesoskafka

./kafka-mesos.sh broker add 0 --cpus 0.5 --heap 300 --mem 300
./kafka-mesos.sh topic add topic-wordapp --broker 0
./kafka-mesos.sh topic add topic-wordcountapp --broker 0
./kafka-mesos.sh topic add topic-meetuprsvp --broker 0