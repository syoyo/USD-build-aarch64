#!/bin/bash

ANDROID_SDK_ROOT=$HOME/Android/Sdk/
#ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk-bundle
ANDROID_NDK_ROOT=$HOME/Android/Sdk/ndk/23.1.7779620/
#CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.10.2.4988404/bin/cmake
CMAKE_BIN=$ANDROID_SDK_ROOT/cmake/3.18.1/bin/cmake



rm -rf build_ndk_osd
mkdir build_ndk_osd

curdir=`pwd`

if [[ -z "${USD_AARCH64_INSTALL_DIR}" ]]; then
  INSTALL_DIR=${curdir}/android_dist
else
  INSTALL_DIR="${USD_AARCH64_INSTALL_DIR}"
fi

cd build_ndk_osd

# NOTE: OSD itself does not depends on ptex, so disable it is safe.
$CMAKE_BIN \
  -G Ninja \
  -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_ROOT/build/cmake/android.toolchain.cmake \
  -DANDROID_ABI=arm64-v8a \
  -DANDROID_PLATFORM=28 \
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
