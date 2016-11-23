#!/bin/bash

set -e

APT_FLAGS="-y"

echo
echo Installing apt-get packages ...
echo

sudo apt-get update
echo #########################################
echo Caffe base
echo #########################################
sudo apt-get install $APT_FLAGS libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev libgflags-dev 
sudo apt-get install $APT_FLAGS libgoogle-glog-dev liblmdb-dev protobuf-compiler libatlas-base-dev
sudo apt-get install $APT_FLAGS --no-install-recommends libboost-all-dev

echo #########################################
echo Caffe python, use python2 
echo #########################################
sudo apt-get install $APT_FLAGS python-dev python-pip gfortran

sudo apt-get install $APT_FLAGS cython  python-skimage python-h5py python-leveldb python-networkx python-pandas
sudo apt-get install $APT_FLAGS python-dateutil python-protobuf python-gflags python-yaml python-pil
sudo apt-get install $APT_FLAGS python-numpy python-scipy python-matplotlib 

echo Remind!!!
echo If Anaconda installed, you don't need to install python package by apt-get any moere 
echo You need to intall protobuf in Anaconda, use $conda install protobuf
echo Don't forget to modify python path in Makefile.config to Anaconda, and open WITH_PYTHON_LAYER
echo Please install CUDA and cudnn by NVIDIA offical package.
echo Please do not forget to add path to config file.
echo Add /usr/local/cuda/lib64 and /lib to /etc/ld.so.conf.d/cuda.conf
echo To make it work use $sudo ldconfig -v
echo
echo Add HDF5 Path to Makefile.config
echo INCLUDE_DIRS := $(PYTHON_INCLUDE) /usr/local/include /usr/lib/x86_64-linux-gnu/hdf5/serial/include
echo LIBRARY_DIRS := $(PYTHON_LIB) /usr/local/lib /usr/lib /usr/lib/x86_64-linux-gnu/hdf5/serial
echo 
echo If you encounter problem about libhdf5.so.10, please do something like this
echo $sudo ln -s libhdf5.so.10 libhdf5.so.7 
echo $sudo ln -s libhdf5_hl.so.10 libhdf5_hl.so.7

