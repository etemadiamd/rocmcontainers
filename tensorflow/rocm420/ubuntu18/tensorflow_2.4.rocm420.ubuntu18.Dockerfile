# Copyright (c) 2021 Advanced Micro Devices, Inc. All Rights Reserved.
#
# V1.3 ROCm-4.2.0 Tensorflow-2.4 Dockerfile for Ubuntu18

FROM ubuntu:18.04

RUN sed -i -e "s/\/archive.ubuntu/\/us.archive.ubuntu/" /etc/apt/sources.list && \
    apt-get clean && \
    apt-get -y update --fix-missing --allow-insecure-repositories && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    aria2 \
    autoconf \
    bc \
    bison \
    bsdmainutils \
    build-essential \
    bzip2 \
    check \
    cifs-utils \
    clang-6.0 \
    clang-format-6.0 \
    clang-tidy-6.0 \
    cmake \
    cmake-qt-gui \
    curl \
    dkms \
    dos2unix \
    doxygen \
    flex \
    g++-multilib \
    gcc-multilib \
    gfortran \
    git \
    locales \
    libatlas-base-dev \
    libbabeltrace1 \
    libboost-dev \
    libboost-system-dev \
    libboost-filesystem-dev \
    libboost-all-dev \
    libboost-program-options-dev \
    libelf-dev \
    libelf1 \
    libfftw3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libhdf5-serial-dev \
    libleveldb-dev \
    liblmdb-dev \
    libncurses5-dev \
    libnuma-dev \
    libopenblas-base \
    libopenblas-dev \
    libopencv-dev \
    libpci3 \
    libpython3.8 \
    libfile-which-perl \
    libprotobuf-dev \
    libpthread-stubs0-dev \
    libsnappy-dev \
    libssl-dev \
    libunwind-dev \
    libxml2 \
    libxml2-dev \
    ocl-icd-dev \
    ocl-icd-opencl-dev \
    pciutils \
    pkg-config \
    protobuf-compiler \
    python-numpy \
    python-pip \
    python-pip-whl \
    python-scipy \
    python-yaml \
    python3-dev \
    python3-pip \
    rpm \
    ssh \
    swig \
    sudo \
    unzip \
    vim \
    virtualenv \
    wget \
    xsltproc && \
    pip3 install Cython && \
    pip3 install enum34 && \
    pip3 install jupyter && \
    pip3 install keras_applications && \
    pip3 install keras_preprocessing && \
    pip3 install mock && \
    pip3 install networkx && \
    pip3 install numpy && \
    pip3 install numpy==1.18.5 && \
    pip3 install optionloop && \
    pip3 install protobuf && \
    pip install Cython && \
    pip install numpy && \
    pip install optionloop && \
    pip install setuptools && \
    pip install CppHeaderParser argparse && \
    ldconfig && \
    cd $HOME && \
    mkdir -p downloads && \
    cd downloads && \
    wget -O rocminstall.py --no-check-certificate https://raw.githubusercontent.com/srinivamd/rocminstaller/master/rocminstall.py && \
    python3 ./rocminstall.py --nokernel --rev 4.2 --nomiopenkernels && \
    cd $HOME && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* downloads

#
RUN locale-gen en_US.UTF-8

#
RUN /bin/sh -c 'ln -sf /opt/rocm-4.2.0 /opt/rocm'

# Add target file to help determine which device(s) to build for
RUN bash -c 'echo -e "gfx803\ngfx900\ngfx906\ngfx908" >> /opt/rocm-4.2.0/bin/target.lst'

# Set up paths
ENV PATH="/opt/rocm-4.2.0/bin:/opt/rocm-4.2.0/opencl/bin:${PATH}"
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Install Bazel
RUN echo "deb [arch=amd64] http://storage.googleapis.com/bazel-apt stable jdk1.8" | tee /etc/apt/sources.list.d/bazel.list
RUN curl https://bazel.build/bazel-release.pub.gpg | apt-key add -
RUN apt-get update --allow-insecure-repositories && apt-get install -y openjdk-8-jdk openjdk-8-jre unzip && apt-get clean && rm -rf /var/lib/apt/lists/* 
RUN cd ~ && rm -rf bazel*.sh && wget https://github.com/bazelbuild/bazel/releases/download/3.1.0/bazel-3.1.0-installer-linux-x86_64.sh  && bash bazel*.sh && rm -rf ~/bazel*.sh

# Clone TF
RUN cd ~ && git clone -b r2.4-rocm-enhanced https://github.com/ROCmSoftwarePlatform/tensorflow-upstream.git tensorflow

ENV TF_PKG_LOC=/tmp/tensorflow_pkg
RUN rm -f $TF_PKG_LOC/tensorflow*.whl

RUN cd $HOME/tensorflow && \
    yes "" | ROCM_PATH=/opt/rocm-4.2.0 TF_NEED_ROCM=1 PYTHON_BIN_PATH=/usr/bin/python3 ./configure && \
    pip3 uninstall -y tensorflow || true && \
    bazel build --config=opt --config=rocm //tensorflow/tools/pip_package:build_pip_package --verbose_failures && \
    bazel-bin/tensorflow/tools/pip_package/build_pip_package $TF_PKG_LOC && \
    pip3 install $TF_PKG_LOC/tensorflow*.whl

RUN rm -rf ~/.cache

# Clone hiptf models and benchmarks
RUN mkdir -p /opt/tensorflow
RUN cd /opt/tensorflow && git clone https://github.com/tensorflow/models.git
RUN cd /opt/tensorflow && git clone https://github.com/tensorflow/examples.git
RUN cd /opt/tensorflow && git clone https://github.com/tensorflow/autograph.git
RUN cd /opt/tensorflow && git clone -b cnn_tf_v2.1_compatible https://github.com/tensorflow/benchmarks.git

# Check ROCm-Kernel compatibility
COPY rocm-kernel-compatibility-test.sh /root/rocm-kernel-compatibility-test.sh
RUN chmod a+x /root/rocm-kernel-compatibility-test.sh

ENTRYPOINT ["/root/rocm-kernel-compatibility-test.sh"]

# Default to a login shell
CMD ["bash", "-l"]
