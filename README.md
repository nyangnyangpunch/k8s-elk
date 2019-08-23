# k8s-elk

ELK Stack install script for CentOS 7

## Requirement

- Git
- Node.js (for [here](#Install-with-cheese))

## Install

- ElasticSearch
- Kibana
- MetricBeat
- ~~Filebeat~~
- ~~Logstash~~

```bash
git clone https://github.com/nyangnyangpunch/k8s-elk.git && cd k8s-elk
chmod 755 install.sh && ./install.sh
```

## Install with cheese

[Cheese repository](https://github.com/nyangnyangpunch/cheese)

- Basic cheese install (without `Grafana`)

```bash
git clone https://github.com/nyangnyangpunch/k8s-elk.git && cd k8s-elk
chmod 755 install.sh && ./install.sh && ./cheese-install.sh
```
