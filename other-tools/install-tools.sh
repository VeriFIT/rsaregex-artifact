#!/bin/bash
set -e
set -o pipefail

NPROC=$(nproc)

echo "Installing Python 3.10.12..."
tar -xzf Python-3.10.12.tgz
cd Python-3.10.12
./configure --prefix=/usr/local
make -j$NPROC
sudo make altinstall
cd ..
rm -rf Python-3.10.12

sudo update-alternatives --install /usr/bin/python python /usr/local/bin/python3.10 2
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.10 2
sudo update-alternatives --config python
sudo update-alternatives --config python3


echo "Installing GNU grep 3.7..."
tar -xf grep-3.7.tar.xz
cd grep-3.7
./configure --prefix=/usr/local
make -j$NPROC
sudo make install
cd ..
rm -rf grep-3.7

echo "Installing OpenJDK 17.0.18..."
cat OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz.part_* > OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar -xzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz -C /usr/lib/jvm
#TODO: will this work?
JDK_DIR=$(tar -tzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz | head -1 | cut -f1 -d"/")
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/$JDK_DIR/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/$JDK_DIR/bin/javac 1

echo "Installing Node.js v12.22.9..."
sudo tar -xJf node-v12.22.9-linux-x64.tar.xz -C /usr/local --strip-components=1

echo "Installing .NET SDK 8.0.124..."
cat dotnet-sdk-8.0.124-linux-x64.tar.gz.part_* > dotnet-sdk-8.0.124-linux-x64.tar.gz
sudo mkdir -p /usr/share/dotnet
sudo tar -xzf dotnet-sdk-8.0.124-linux-x64.tar.gz -C /usr/share/dotnet
sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet

echo "All packages installed successfully!"
echo "Versions:"
python3.10 --version
java --version
node -v
dotnet --version
grep --version
