#!/bin/bash

set -e

APT_FLAGS="-y"

echo
echo Installing apt-get packages ...
echo

sudo apt-get update

# Caffe base
sudo apt-get install $APT_FLAGS libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev libgflags-dev 
sudo apt-get install $APT_FLAGS libgoogle-glog-dev liblmdb-dev protobuf-compiler libatlas-base-dev
sudo apt-get install $APT_FLAGS --no-install-recommends libboost-all-dev

# Caffe python, please use python3
sudo apt-get install $APT_FLAGS python3-dev python3-pip gfortran

# Caffe pip
sudo apt-get install $APT_FLAGS cython3  python3-skimage python3-h5py python3-leveldb python3-networkx python3-pandas
sudo apt-get install $APT_FLAGS python3-dateutil python-protobuf python-gflags python3-yaml python3-pil
#sudo apt-get install $APT_FLAGS python3-numpy python3-scipy python3-matplotlib 
#Remind
echo Please install CUDA and cudnn by NVIDIA offical package.
echo Please do not forget to add path to config file.
echo Add /usr/local/cuda/lib64 and /lib to /etc/ld.so.conf.d/cuda.conf
echo To make it work use :sudo ldconfig -v
echo
echo Add HDF5 Path to Makefile.config
echo INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/lib/x86_64-linux-gnu/hdf5/serial/include
echo LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial
echo
