#!/ bin / bash

#Build node and gateway images
cd ~/PyGrid
conda activate pysyft
sed -i -e 's,git+git://github.com/OpenMined/PySyft@master,git+git://github.com/OpenMined/PySyft@79d1507cd90435a0203b07fc670699507fade7c5,g' ./app/websocket/requirements.txt
sudo docker build -t openmined/grid-node ./app/websocket/
sudo docker build -t openmined/grid-gateway ./gateway/

git clone https://github.com/H4LL/GridExperiment.git
mkdir GridExperiment/results


#SINGLE EXECUTION EXPERIMENT

#SET UP SUBNET
sudo docker-compose up &
sleep 6

#DISTRIBUTE DATA
while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append GridExperiment/results/connect_stats.txt; sleep 0.5; done &
STATS=$!
sudo tcpdump -i lo -vv > GridExperiment/results/connect.pcap &
PCAP=$!
python GridExperiment/python/connect_nodes.py | tee GridExperiment/results/connect_nodes_output.txt
sudo kill -9 "$STATS"
sudo kill -9 "$PCAP"


#TRAIN ON DATA
while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append GridExperiment/results/train_stats.txt; sleep 0.5; done &
STATS=$!
sudo tcpdump -i lo -vv > GridExperiment/results/train.pcap &
PCAP=$!
python GridExperiment/python/learn_from_grid.py | tee --append GridExperiment/results/learn_from_grid_output.txt
sudo kill -9 "$STATS"
sudo kill -9 "$PCAP"

#TEAR DOWN SUBNET
sudo docker stop $(sudo docker ps -a -q)
