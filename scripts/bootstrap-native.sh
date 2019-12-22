#!/bin/bash

rm -rf build
mkdir build

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

cd build

BOOST_ROOT=${curdir}/boost \
TBBROOT=${INSTALL_DIR} \
cmake \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DPXR_BUILD_TESTS=Off \
  -DPXR_BUILD_IMAGING=On \
  -DPXR_BUILD_USDVIEW=Off \
  -DPXR_ENABLE_PYTHON_SUPPORT=Off \
  -DPXR_ENABLE_GL_SUPPORT=Off \
  -DPXR_ENABLE_HDF5_SUPPORT=Off \
  -DPXR_ENABLE_PTEX_SUPPORT=On \
  ../USD-aarch64
