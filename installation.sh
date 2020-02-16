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
pip install tqdm


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
