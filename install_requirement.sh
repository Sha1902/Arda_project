#!/bin/bash

# Update and install necessary packages
apt-get update
apt-get install cmake -y
apt-get install -y --no-install-recommends \
        automake \
        build-essential \
        ca-certificates \
        curl \
        git \
        libcurl3-dev \
        libfreetype6-dev \
        libpng-dev \
        libtool \
        libzmq3-dev \
        mlocate \
        openjdk-8-jdk\
        openjdk-8-jre-headless \
        pkg-config \
        python-dev \
        software-properties-common \
        swig \
        unzip \
        wget \
        zip \
        zlib1g-dev \
        python3-distutils \
        cmake \
        libgtk-3-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libv4l-dev \
        libxvidcore-dev \
        libx264-dev \
        libjpeg-dev \
        libtiff-dev \
        gfortran \
        openexr \
        libatlas-base-dev \
        python3-dev \
        python3-numpy \
        libtbb2 \
        libtbb-dev \
        libdc1394-22-dev \
        libopenexr-dev \
        libgstreamer-plugins-base1.0-dev \
        libgstreamer1.0-dev

# Set up Bazel
BAZEL_VERSION="6.1.0"
mkdir /bazel
cd /bazel
curl -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36" -fSsL -O "https://github.com/bazelbuild/bazel/releases/download/${BAZEL_VERSION}/bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh"
curl -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/57.0.2987.133 Safari/537.36" -fSsL -o /bazel/LICENSE.txt "https://raw.githubusercontent.com/bazelbuild/bazel/master/LICENSE"
chmod +x bazel-*.sh
./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
rm ./bazel-${BAZEL_VERSION}-installer-linux-x86_64.sh
cd /

# Download OpenCV sources
OPENCV_VERSION_TAG="3.4.0"
mkdir /opencv
cd /opencv
curl -sSL --retry 5 "https://github.com/opencv/opencv/tarball/${OPENCV_VERSION_TAG}" | tar --strip-components=1 -xzf -

# Build and install OpenCV
mkdir build
cd /opencv/build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D BUILD_opencv_python3=OFF \
    -D BUILD_opencv_python2=OFF \
    -D WITH_PYTHON=OFF \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D WITH_CUDA=OFF \
    -D CMAKE_INSTALL_PREFIX=/usr/ \
    -D OPENCV_GENERATE_PKGCONFIG=ON \
    -D BUILD_opencv_apps=OFF \
    -D BUILD_opencv_perf_tests=OFF \
    -D CMAKE_CXX_STANDARD=14 \
    ..

make -j 8 all install

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "All requirements have been installed."

exit
