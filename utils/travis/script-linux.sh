#!/bin/bash
# Build and run tests with Travis CI.

set -e -x

root=$PWD

DEPS_DIR="$TRAVIS_BUILD_DIR/deps"
mkdir -p "$DEPS_DIR"

# Update CMake (https://github.com/boostorg/hana/blob/master/.travis.yml)
CMAKE_URL="https://cmake.org/files/v3.7/cmake-3.7.2-Linux-x86_64.tar.gz"
dir="$DEPS_DIR/cmake"
mkdir -p "$dir"
wget --no-check-certificate --quiet -O - "$CMAKE_URL" | tar --strip-components=1 -xz -C "$dir"
export PATH="$dir/bin:$PATH"
cmake --version

mkdir build
cd build
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_CXX_COMPILER=$COMPILER \
    -DCMAKE_INSTALL_PREFIX=$PWD/install \
    -DWITH_QT5=OFF \
    "$root"
make
make install

export qxtglobalshortcut_DIR=$PWD/install/lib/cmake/qxtglobalshortcut

mkdir example
cd example
cmake \
    -DCMAKE_BUILD_TYPE=Debug \
    -DCMAKE_CXX_COMPILER=$COMPILER \
    "$root/example-qt4"
make

xvfb-run sh -c '(sleep 2; xdotool key ctrl+shift+t) & ./qxtglobalshortcut_test'
