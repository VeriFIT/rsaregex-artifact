#!/bin/bash

echo "Installing .deb packages"
cd packages
sudo dpkg -i *.deb

cd ../tools-install-files
for script in install-*.sh; do
    ./"$script"
done

cd ../pip-packages
python -m pip install ./*
sudo python -m pip install ./*


