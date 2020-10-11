#!/bin/bash

curdir=`pwd`

# exit script on error
set -e 

NJOBS=8

# Set install directory if required(default = `pwd`/dist)
# export USD_AARCH64_INSTALL_DIR=/path/to/dist

./scripts/bootstrap-tbb.sh

cd build_tbb; make -j ${NJOBS} && make install
cd ${curdir}

./scripts/bootstrap-ptex.sh
cd build_ptex; make -j ${NJOBS}  && make install
cd ${curdir}

./scripts/bootstrap-osd.sh
cd build_osd; make -j ${NJOBS} && make install
cd ${curdir}

./scripts/bootstrap-native.sh
cd build; make  -j ${NJOBS} && make install
cd ${curdir}

