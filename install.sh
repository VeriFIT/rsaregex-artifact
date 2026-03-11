#!/bin/bash

echo "Installing .deb packages"
cd packages
sudo dpkg -i *.deb

cd ../tools-install-files
./install-python.sh
./install-pcre2.sh
./install-grep.sh
./install-js.sh
./install-java.sh
./install-dotnet.sh

cd ../pip-packages
python -m pip install ./*
sudo python -m pip install ./*


