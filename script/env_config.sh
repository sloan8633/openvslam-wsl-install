cd ~ \
&& sudo apt update -y \
&& sudo apt upgrade -y --no-install-recommends
# basic dependencies
sudo apt install -y build-essential pkg-config cmake git wget curl unzip
# g2o dependencies
sudo apt install -y libatlas-base-dev libsuitesparse-dev
# OpenCV dependencies
sudo apt install -y libgtk-3-dev \
&& sudo apt install -y ffmpeg \
&& sudo apt install -y libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libavresample-dev
# eigen dependencies
sudo apt install -y gfortran
# other dependencies
sudo apt install -y libyaml-cpp-dev libgoogle-glog-dev libgflags-dev
# (using SocketViewer dependencies)
# Protobuf dependencies
sudo apt install -y autogen autoconf libtool
# Node.js
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
&& sudo apt install -y nodejs
# install Eigen from source
cd ~ \
&& wget http://bitbucket.org/eigen/eigen/get/3.3.4.tar.bz2 --show-progress \
&& tar xf 3.3.4.tar.bz2 \
&& rm -rf 3.3.4.tar.bz2 \
&& cd eigen-eigen-5a0156e40feb \
&& mkdir -p build && cd build \
&& cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    .. \
&& make \
&& sudo make install
# install OpenCV from source
cd ~ \
&& wget https://github.com/opencv/opencv/archive/3.4.0.zip --show-progress \
&& unzip -q 3.4.0.zip \
&& rm -rf 3.4.0.zip \
&& cd opencv-3.4.0 \
&& mkdir -p build && cd build \
&& cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DENABLE_CXX11=ON \
    -DBUILD_DOCS=OFF \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_JASPER=OFF \
    -DBUILD_OPENEXR=OFF \
    -DBUILD_PERF_TESTS=OFF \
    -DBUILD_TESTS=OFF \
    -DWITH_EIGEN=ON \
    -DWITH_FFMPEG=ON \
    -DWITH_OPENMP=ON \
    -DWITH_VTK=OFF \
    .. \
&& make -j4 \
&& sudo make install
# install DBoW2
cd ~ \
&& git clone https://github.com/shinsumicco/DBoW2.git \
&& cd DBoW2 \
&& mkdir build && cd build \
&& cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    .. \
&& make -j4 \
&& sudo make install
# install g2o
cd ~ \
&& git clone https://github.com/RainerKuemmerle/g2o.git \
&& cd g2o \
&& git checkout 9b41a4ea5ade8e1250b9c1b279f3a9c098811b5a \
&& mkdir build && cd build \
&& cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DCMAKE_CXX_FLAGS=-std=c++11 \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_UNITTESTS=OFF \
    -DBUILD_WITH_MARCH_NATIVE=ON \
    -DG2O_USE_CHOLMOD=OFF \
    -DG2O_USE_CSPARSE=ON \
    -DG2O_USE_OPENGL=OFF \
    -DG2O_USE_OPENMP=ON \
    .. \
&& make -j4 \
&& sudo make install
# install socketview
cd ~ \
&& git clone https://github.com/shinsumicco/socket.io-client-cpp \
&& cd socket.io-client-cpp \
&& git submodule init \
&& git submodule update \
&& mkdir build && cd build \
&& cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr/local \
    -DBUILD_UNIT_TESTS=OFF \
    .. \
&& make -j4 \
&& sudo make install
# install protobuf 
cd ~ \
&& wget https://github.com/google/protobuf/archive/v3.6.1.tar.gz --show-progress \
&& tar xf v3.6.1.tar.gz \
&& cd protobuf-3.6.1 \
&& ./autogen.sh \
&& ./configure \
    --prefix=/usr/local \
    --enable-static=no
make -j4 \
&& sudo make install \
&& sudo ldconfig
# install opengl
sudo apt-get -y install libgl1-mesa-dev
# download and build vslam
cd ~ \
&& git clone https://github.com/xdspacelab/openvslam \
&& cd openvslam \
&& mkdir build && cd build \
&& cmake \
    -DBUILD_WITH_MARCH_NATIVE=ON \
    -DUSE_PANGOLIN_VIEWER=OFF \
    -DUSE_SOCKET_PUBLISHER=ON \
    -DUSE_STACK_TRACE_LOGGER=ON \
    -DBOW_FRAMEWORK=DBoW2 \
    -DBUILD_TESTS=ON \
    .. \
&& make -j4
# config socketviewer
cd ~/openvslam/viewer \
&& npm install