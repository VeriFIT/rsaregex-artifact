cat OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz.part_* > OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz
sudo mkdir -p /usr/lib/jvm
sudo tar -xzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz -C /usr/lib/jvm
#TODO: will this work?
JDK_DIR=$(tar -tzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz | head -1 | cut -f1 -d"/")
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/$JDK_DIR/bin/java 1
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/$JDK_DIR/bin/javac 1
