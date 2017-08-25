#!/usr/bin/env sh
set -evx
env | sort

mkdir build || true
mkdir build/$GTEST_TARGET || true
cd build/$GTEST_TARGET
cmake -Dgtest_build_samples=ON \
      -Dgmock_build_samples=ON \
      -Dgtest_build_tests=ON \
      -Dgmock_build_tests=ON \
      -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
      -DCMAKE_CXX_FLAGS=$CXX_FLAGS \
      -DCMAKE_VERBOSE_MAKEFILE=$VERBOSE_MAKE \
      ../../$GTEST_TARGET
make
CTEST_OUTPUT_ON_FAILURE=1 make test
