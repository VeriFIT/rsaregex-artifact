echo "Installing .NET SDK 8.0.124..."
cat dotnet-sdk-8.0.124-linux-x64.tar.gz.part_* > dotnet-sdk-8.0.124-linux-x64.tar.gz
sudo mkdir -p /usr/share/dotnet
sudo tar -xzf dotnet-sdk-8.0.124-linux-x64.tar.gz -C /usr/share/dotnet
sudo ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet
