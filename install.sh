#!/bin/bash

# Install java
yum -y update
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel
echo `java -version`


# Download packages
wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/kibana/kibana-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-7.3.0-x86_64.rpm
wget https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-7.3.0-x86_64.rpm

# oc command install
wget https://github.com/openshift/origin/releases/download/v1.5.1/openshift-origin-client-tools-v1.5.1-7b451fc-linux-64bit.tar.gz
tar –xvf openshift-origin-client-tools-v1.5.1-7b451fc-linux-64bit.tar.gz
mv openshift-origin-client-tools-v1.5.1-7b451fc-linux-64bit oc-tool
cd oc-tool
export PATH=~/oc-tool:$PATH
# oc adm policy add-scc-to-user privileged system:serviceaccount:kube-system:metricbeat
oc patch namespace kube-system -p \
  '{"metadata": {"annotations": {"openshift.io/node-selector": ""}}}'
kubectl create -f metricbeat-kubernetes.yaml

# Extract
# /etc/elasticsearch/jvm.options 
rpm -ivh elasticsearch-7.3.0-x86_64.rpm
rpm -ivh kibana-7.3.0-x86_64.rpm
rpm -ivh filebeat-7.3.0-x86_64.rpm
rpm -ivh metricbeat-7.3.0-x86_64.rpm


# Run
systemctl start elasticsearch.service
systemctl start kibana.service
systemctl start filebeat.service

# MetricBeat
metricbeat modules enable kubernetes
metricbeat setup
systemctl start metricbeat

# Create pod
# kubectl create -f filebeat-kubernetes.yml

echo 'Done!'
