#!/bin/bash

ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake

rm -rf build_ndk_ptex
mkdir build_ndk_ptex

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/android_dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

# Android cmake would find NDK's zlib
# PTEX_ZLIB_PATH=/usr
#-DPTEX_ZLIB_PATH=${PTEX_ZLIB_PATH} 

cd build_ndk_ptex

$CMAKE_BIN \
  -G Ninja \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=28 \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  ../ptex-aarch64
