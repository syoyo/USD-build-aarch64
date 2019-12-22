#!/bin/bash

rm -rf build_ptex
mkdir build_ptex

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

# Set path to system zlib or your zlib build
PTEX_ZLIB_PATH=/usr

cd build_ptex

cmake \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DPTEX_ZLIB_PATH=${PTEX_ZLIB_PATH} \
  ../ptex-aarch64
