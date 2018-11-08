export ZK_HOST="172.31.9.21:2181"
export KAFKA_HOST="172.31.33.33:9092"

# ADD REPLICATION

bin/kafka-topics.sh --zookeeper $ZK_HOST --create --topic third_topic --partitions 3 --replication-factor 1
