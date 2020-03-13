#!/bin/bash

#Get Updates
sudo apt update -y

#Get GCC
sudo apt install gcc -y
sudo apt install moreutils -y
sudo apt install curl -y

#Install Docker
sudo snap install docker
sudo apt install docker-compose -y

#Install Anaconda
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2019.03-Linux-x86_64.sh
bash Anaconda3-2019.03-Linux-x86_64.sh
export PATH=~/anaconda3/bin:$PATH
source ~/.bashrc

#Add the domain
sudo echo '127.0.0.1       host.docker.internal' >> /etc/hosts

#Install PySyft req
conda create -n pysyft python=3.7
conda activate pysyft
conda install jupyter notebook
pip install --upgrade --force-reinstall zstd
pip install tqdm
pip install pandas
pip install matplotlib

# Install PySyft Library
cd ~
git clone https://github.com/OpenMined/PySyft.git
cd PySyft/
pip install .

# Create PyGrid images
cd ~
git clone https://github.com/OpenMined/PyGrid.git
cd PyGrid
sudo docker build -t openmined/grid-node ./app/websocket/
sudo docker build -t openmined/grid-gateway ./gateway/

cd ~
