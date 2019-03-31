#!/bin/sh

# install nessary packages for build system

sudo apt-get install -y git
sudo apt-get install -y cmake
sudo apt-get install -y autoconf
sudo apt-get install -y automake
sudo apt-get install -y libtool
sudo apt-get install -y doxygen

# clone required packages
mkdir config
cd config

git clone https://github.com/sysrepo/sysrepo.git
git clone https://github.com/CESNET/libyang.git
git clone https://github.com/protocolbuffers/protobuf.git
git clone https://github.com/protobuf-c/protobuf-c.git
git clone https://github.com/sysrepo/libredblack.git
wget http://dist.schmorp.de/libev/Attic/libev-4.22.tar.gz
tar -xzvf libev-4.22.tar.gz
wget https://ftp.pcre.org/pub/pcre/pcre-8.35.tar.gz
tar -xzvf pcre-8.35.tar.gz


# Build packages
cd libev-4.22/
./configure
make
sudo make install
cd ..

cd libredblack/
./configure
make
sudo make install
cd ..

cd pcre-8.35/
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

cd libyang/
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

cd protobuf
./autogen.sh
./configure
make
sudo make install
cd ..

cd protobuf-c
./autogen.sh
./configure
make
sudo make install
cd ..

cd sysrepo
mkdir build
cd build
cmake ..
make
sudo make install
cd ../..

