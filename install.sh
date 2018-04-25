#! /bin/bash

# Sample installation script. Adjustments might be neccessary.

INSTALL_PREFIX=$HOME/.conda/envs/py36
THIRD_PARTY_ROOT=/home/reppinjo/.local/

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

# Uncomment the next line if you want to use Intel Fotran compiler
# (otherwise gfortran will be used). Make sure $MKLROOT is set. This can be achieved by sourcing
# where $INTEL_HOME is the root of the intel compiler suite (typically /opt/intel), and <arch> is either intel64 or ia32, following need to be load externally
export FC=ifort

# Some needed environment variables.
export BOOST_ROOT=${THIRD_PARTY_ROOT}
#export HDF5_ROOT=/usr
export Boost_NO_SYSTEM_PATHS=ON
CMAKE=$HOME/.local/bin/cmake

#TODO:
# Please edit the pathes below according to your file system
# If your have another version of xerces_c than 3.1 please edit also the single
# entry in ./src/CMakeLists.txt which starts with ${XERCES} and ends with .so
${CMAKE} --version
${CMAKE} -DSRW_OPTIMIZED=ON \
      -DDEVELOPER_INSTALL=ON \
      -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
      -DSingFElPhotonDiffractor=ON \
      -DCrystFElPhotonDiffractor=ON \
      -Ds2e=ON \
      -DS2EReconstruction_EMC=ON\
      -DS2EReconstruction_DM=ON\
      -DFEFFPhotonInteractor=ON\
      -DXCSITPhotonDetector=OFF \
      -Dwpg=ON\
      -Dgenesis=ON\
      -Docelot=ON\
      -DGEANT4_ROOT=${THIRD_PARTY_ROOT}/geant4.10 \
      -DBOOST_ROOT=${BOOST_ROOT} \
      -DXERCESC_ROOT=${THIRD_PARTY_ROOT} \
      ..

# Build the project.
make -j8

# Install the project.
make install
