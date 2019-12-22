#!/bin/bash

CMAKE_BIN=cmake

rm -rf build_osd
mkdir build_osd

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

cd build_osd

# NOTE: OSD itself does not depends on ptex, so disable it is safe.
$CMAKE_BIN \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DNO_TUTORIALS=On \
  -DNO_EXAMPLES=On \
  -DNO_REGRESSION=On \
  -DNO_DOC=On \
  -DNO_OMP=On \
  -DNO_TBB=On \
  -DNO_CUDA=On \
  -DNO_OPENCL=On \
  -DNO_OPENGL=On \
  -DNO_TESTS=On \
  -DNO_GLTESTS=On \
  -DNO_GLFW=On \
  -DNO_PTEX=On \
  ../OpenSubdiv-aarch64
