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
sudo apt-get install $APT_FLAGS python-dev python-pip gfortran

# Caffe pip
sudo apt-get install $APT_FLAGS cython  python-skimage python-h5py python-leveldb python-networkx python-pandas
sudo apt-get install $APT_FLAGS python-dateutil python-protobuf python-gflags python-yaml python-pil
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
