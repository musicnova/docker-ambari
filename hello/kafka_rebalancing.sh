export ZK_HOST="172.31.9.21:2181"
export KAFKA_HOST="172.31.33.33:9092"

# ADD REPLICATION
# https://www.udemy.com/kafka-monitoring-and-operations/learn/v4/t/lecture/11348004?start=0

bin/kafka-topics.sh --zookeeper $ZK_HOST --create --topic third_topic --partitions 3 --replication-factor 1
