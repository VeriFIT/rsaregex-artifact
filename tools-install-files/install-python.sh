#!/bin/bash

NPROC=$(nproc)

echo "Installing Python 3.10.12..."
tar -xzf Python-3.10.12.tgz
cd Python-3.10.12
./configure --prefix=/usr/local --enable-optimizations
make -j$NPROC
sudo make altinstall
cd ..
rm -rf Python-3.10.12

sudo update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 2
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.10 2 
echo "0" | sudo update-alternatives --config python
echo "0" | sudo update-alternatives --config python3
