#!/bin/bash

rmdir build_tbb
mkdir build_tbb

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

cd build_tbb

cmake -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DTBB_BUILD_TESTS=Off \
  ../tbb

