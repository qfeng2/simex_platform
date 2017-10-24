#! /bin/bash

# Sample installation script. Adjustments might be neccessary.

INSTALL_PREFIX=$PWD

# Check for existing build directory, remove if foun.d
if [ -d build ]
then
    echo "Found build/ directory, will remove it now."
    rm -rvf build
fi

# Create new build dir and cd into it.
mkdir -v build
cd build
echo "Changed dir to $PWD."

# cmake, make, make install sequence.
cmake -DDEVELOPER_INSTALL=ON \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
      -DSingFElPhotonDiffractor=OFF \
      -DCrystFELPhotonDiffractor=OFF \
      -Ds2e=OFF \
      -DS2EReconstruction_EMC=OFF\
      -DS2EReconstruction_DM=OFF\
      -DFEFFPhotonInteractor=OFF\
      -Dwpg=OFF \
      -DGenesisPhotonSource=OFF\
      -DXCSITPhotonDetector=OFF \
      .. && \\
make -j8 && make install && cd ..
