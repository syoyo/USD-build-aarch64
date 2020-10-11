#!/bin/bash

ANDROID_SDK_ROOT=$HOME/Android/Sdk/
ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake

rm -rf build_ndk
mkdir build_ndk

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/android_dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

cd build_ndk

# NOTE: for some reason we need to specify path to Boost using `Boost_INCLUDE_DIR`
TBBROOT=${INSTALL_DIR} \
$CMAKE_BIN \
  -G Ninja \
  -DBoost_INCLUDE_DIR=${curdir}/boost/ \
  -DCMAKE_BUILD_TYPE=RelWithDebInfo \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=28 \
  -DCMAKE_INSTALL_PREFIX=${INSTALL_DIR} \
  -DPXR_BUILD_TESTS=Off \
  -DPXR_BUILD_IMAGING=Off \
  -DPXR_BUILD_USDVIEW=Off \
  -DPXR_ENABLE_PYTHON_SUPPORT=Off \
  -DPXR_ENABLE_GL_SUPPORT=Off \
  -DPXR_ENABLE_HDF5_SUPPORT=Off \
  -DPXR_ENABLE_PTEX_SUPPORT=Off \
  ../USD-aarch64
