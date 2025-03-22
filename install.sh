#!bin/bash

sudo apt update
sudo apt install htop -y

sudo apt install prometheus-node-exporter
sudo systemctl start prometheus-node-exporter
sudo systemctl enable prometheus-node-exporter

sudo apt install prometheus

# Edit ./prometheus/prometheus.yml file to use node_exporter for scrape_configs

sudo systemctl restart prometheus

sudo apt-get install grafana
sudo systemctl start grafana-server 
sudo systemctl enable grafana-server

sudo apt install stress -y
