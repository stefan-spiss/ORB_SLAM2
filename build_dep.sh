#!/bin/bash

echo "Configuring and building Thirdparty/DBoW2 ..."

cd $1/Thirdparty/DBoW2
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j8

echo "Configuring and building Thirdparty/g2o ..."

cd $1/Thirdparty/g2o

mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release
make -j8

echo "Uncompress vocabulary ..."

cd $1/Vocabulary
tar -xf ORBvoc.txt.tar.gz
