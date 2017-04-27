#!/bin/bash
# Build with Travis CI.

set -e -x

root=$PWD
mkdir -p build
cd build

export QTDIR=/usr/local/opt/qt5
export PATH=$QTDIR/bin:$PATH
cmake -DCMAKE_INSTALL_PREFIX=$PWD/install ..
make
make install
