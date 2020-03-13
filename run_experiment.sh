#!/bin/bash
cd ~/PyGrid
mkdir GridExperiment/results

#SET UP SUBNET
sudo docker-compose -f docker-compose-mac.yml up &
sleep 10

#DISTRIBUTE DATA
while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append GridExperiment/results/connect_stats.txt; sleep 0.5; done &
STATS=$!
sudo tcpdump -i lo > GridExperiment/results/connect.pcap &
PCAP=$!
python GridExperiment/python/connect_nodes.py | tee GridExperiment/results/connect_nodes_output.txt
sudo kill -9 "$STATS"
sudo kill -9 "$PCAP"

#TEAR DOWN SUBNET
sudo docker stop $(sudo docker ps -a -q)
