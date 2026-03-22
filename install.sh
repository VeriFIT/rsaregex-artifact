#!/bin/bash

echo "Installing .deb packages"
cd packages
sudo dpkg -i *.deb

cd ../tools-install-files
./install-python.sh

cd ../pip-packages
python3.10 -m pip install ./*
# sudo python -m pip install ./*

cd ../tools-install-files
./install-pcre2.sh
./install-grep.sh
./install-js.sh
./install-java.sh
./install-dotnet.sh


cd ../experiments/matchers
./compile-java.sh
./compile-dotnet.sh
