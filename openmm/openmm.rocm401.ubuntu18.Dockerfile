FROM ubuntu:18.04

RUN apt-get clean && \
    apt-get -y update --fix-missing --allow-insecure-repositories && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    aria2 \
    bison \
    bzip2 \
    check \
    cifs-utils \
    cmake \
    curl \
    dkms \
    dos2unix \
    doxygen \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    locales \
    libatlas-base-dev \
    libboost-all-dev \
    libboost-all-dev \
    libboost-program-options-dev \
    libelf-dev \
    libelf-dev \
    libelf1 \
    libfftw3-dev \
    libfftw3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libhdf5-serial-dev \
    libleveldb-dev \
    liblmdb-dev \
    libnuma-dev \
    libopenblas-base \
   libopenblas-base \
    libopenblas-dev \
    libopencv-dev \
    libpci3 \
    libprotobuf-dev \
    libsnappy-dev \
    libssl-dev \
    libunwind-dev \
    ocl-icd-dev \
    ocl-icd-opencl-dev \
    pkg-config \
    protobuf-compiler \
    python-numpy \
    python-pip \
    python-pip-whl \
    python-scipy \
    python-yaml \
    python3-dev \
    python3-pip \
    ssh \
    swig \
    sudo \
    unzip \
    vim \
    xsltproc && \
        pip3 install Cython && \
        pip3 install numpy && \
        pip install numpy && \
        pip install setuptools && \
        pip install CppHeaderParser argparse && \
    wget --no-check-certificate http://sourceforge.net/projects/half/files/latest/download && \
    mv download download.zip && \
    unzip download.zip -d half && \
    mv half /usr/include && \
    cd $HOME && rm -rf $HOME/rough && \
    cd /tmp && \
    wget https://github.com/opencv/opencv/archive/3.4.0.zip && unzip 3.4.0.zip && \
    rm *.zip && \
    mkdir build && \
    cd /tmp/build && \
    cmake -DWITH_OPENCL=OFF -DWITH_OPENCLAMDFFT=OFF -DWITH_OPENCLAMDBLAS=OFF -DWITH_VA_INTEL=OFF -DWITH_OPENCL_SVM=OFF ../opencv-3.4.0 && \
    make -j12 && \
    make install && \
    ldconfig && \
    cd $HOME && \
    ldconfig && \
    cd $HOME && \
    apt-get clean && \
    rm -rf /tmp/build /tmp/opencv-3.4.0 /var/lib/apt/lists/*

#
RUN cd $HOME && \
    mkdir - downloads && \
    cd downloads && \
    wget -O rocminstall.py --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocminstaller/master/rocminstall.py && \
    python3 ./rocminstall.py --nokernel --rev 4.0.1 --nomiopenkernels

#
RUN /bin/sh -c 'ln -sf /opt/rocm-4.0.1 /opt/rocm'

#
RUN locale-gen en_US.UTF-8

# Set up paths
ENV PATH="/opt/rocm-4.0.1/bin:/opt/rocm-4.0.1/opencl/bin:${PATH}"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

#
RUN cd /opt &&\
    git clone --recursive https://github.com/arghdos/openmm.git &&\
    cd openmm &&\
    git checkout hip &&\
    mkdir build &&\
    cd build &&\
    PATH=$PATH:/opt/rocm-4.0.1/bin cmake .. &&\
    make  &&\
    make install &&\
    cd python/ &&\
    export OPENMM_INCLUDE_PATH=/usr/local/openmm/include &&\
    export OPENMM_LIB_PATH=/usr/local/openmm/lib &&\
    python3 setup.py install

# Default to a login shell
CMD ["/bin/bash", "-l"]
