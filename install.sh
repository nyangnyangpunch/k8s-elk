#!/bin/bash

# Install java
yum -y update
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
echo `java -version`


# Download packages
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.3.0-x86_64.rpm


# Extract
rpm -ivh elasticsearch-7.3.0-x86_64.rpm
rpm -ivh kibana-7.3.0-x86_64.rpm
rpm -vi filebeat-7.3.0-x86_64.rpm


# Execute
systemctl start elasticsearch.service
systemctl start kibana.service
systemctl start filebeat.service


# Create pod
kubectl create -f filebeat-kubernetes.yml

echo 'Done!'
