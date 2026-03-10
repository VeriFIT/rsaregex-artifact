#!/bin/bash
NPROC=$(nproc)

echo "Installing GNU grep 3.7..."
tar -xf grep-3.7.tar.xz
cd grep-3.7
./configure --prefix=/usr/local
make -j$NPROC
sudo make install
cd ..
rm -rf grep-3.7
