#!/ bin / bash

#Get Updates
sudo apt update

#Get GCC
sudo apt install gcc
sudo apt install moreutils

#Install Docker
sudo snap install docker
sudo apt install docker-compose

#Install Anaconda
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
source ~/.bashrc

#Install PySyft req
conda create -n pysyft python=3.7
conda activate pysyft
conda install jupyter notebook
pip install --upgrade --force-reinstall zstd

# Install PySyft Library
cd ~
git clone https://github.com/OpenMined/PySyft.git
cd PySyft/
git checkout 79d1507cd90435a0203b07fc670699507fade7c5
pip install .

#Install PyGrid
cd ~
git clone https://github.com/OpenMined/PyGrid.git
cd PyGrid
git checkout 728f99b07669af795907d1e6d88fe3ceab9ac955
pip install .
pip install tqdm

#Build node and gateway images

sed -i -e 's,git+git://github.com/OpenMined/PySyft@master,git+git://github.com/OpenMined/PySyft@79d1507cd90435a0203b07fc670699507fade7c5,g' ./app/websocket/requirements.txt
sudo docker build -t openmined/grid-node ./app/websocket/
sudo docker build -t openmined/grid-gateway ./gateway/


#SINGLE EXECUTION EXPERIMENT

#SET UP SUBNET
sudo docker-compose up &
SUBNET=$!

#DISTRIBUTE DATA
while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append connect_stats.txt; sleep 0.5; done &
STATS=$!
python connect_nodes.py > connect_nodes_output.txt
sudo kill -9 "$STATS"

#TRAIN ON DATA
while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append train_stats.txt; sleep 0.5; done &
STATS=$!
python learn_from_grid.py > learn_from_grid_output.txt
sudo kill -9 "$STATS"

#TEAR DOWN SUBNET
sudo kill -9 "$SUBNET"



# TESTING BUILD PROCESS

# Run envirnment from docker-compose.yml file
sudo docker-compose up

#RUN FROM OTHER TERMINAL
# while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append ../connect_stats.txt; sleep 0.5; done

#RUN FROM OTHER TERMINAL
# Run jupyter notebook to interact with Grid network using tutorials
# conda activate pysyft
# cd ~/PyGrid
# jupyter notebook --ip 0.0.0.0 --port 8888

#RUN FROM OTHER TERMINAL
# Records the performance statistics of each docker host at timestamps
# while true; do sudo docker stats --no-stream | ts '[%H:%M:%S]' | tee --append stats.txt; sleep 0.5; done

#RUN FROM OTHER TERMINAL
# Records the network data on loopback interface
# sudo tcpdump -i lo | tee traffic.pcap
