```
# Copyright (c) 2021 Advanced Micro Devices, Inc. All Rights Reserved.
```
# ROCm-4.3.1 Container

## 1.0 How to Use Docker Container

#### On Ubuntu 18/20 HWE, CentOS/RHEL 7.x, or SLES 15 SP2, use docker:
```
# Launch container in interactive mode, bash shell
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/rocm431-ubuntu18 bash
```
#### On CentOS/RHEL 8.x, use podman:
```
# Launch container in interactive mode, bash shell
sudo podman run -it --privileged docker://amddcgpuce/rocm431-ubuntu18 bash
```

## 2.0 Steps to build Singularity container from docker image
#### Download Singularity Definition File
```
# Download Singularity Definition file
wget -O rocm431.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/rocm/rocm431/ubuntu18/rocm431.ubuntu18.sdf
```
#### Build Singularity Image File (SIF)
##### On Ubuntu 18.04/20.04 HWE with singularity installed under /usr/local/bin
```
sudo /usr/local/bin/singularity build rocm431.ubuntu18.sif rocm431.ubuntu18.sdf
```
##### On CentOS/RHEL 8 with singularity RPM installed
```
sudo singularity build rocm431.ubuntu18.sif rocm431.ubuntu18.sdf
```

## 3.0 Example Usage of ROCm-4.3.1 Docker Container
#### 
```
# Launch container in interactive mode, bash shell on a Ubuntu18 system
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/rocm431-ubuntu18 bash

# Example usage - build and run bit_extract sample
cd /opt/rocm/hip/samples/0_Intro/bit_extract
make HIP_PATH=/opt/rocm/hip
./bit_extract

# Example usage of ROCm-utilities
rocminfo
clinfo
rocm-smi --showhw
```

## 4.0 Example Usage of ROCm Singularity Container
### Run Help
```
singularity run-help rocm431.ubuntu18.sif
```
##### Output
```
    singularity run rocm431.ubuntu18.sif /bin/bash -c "cp -r /opt/rocm/hip/samples/ $HOME/Documents/"
    singularity run rocm431.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/samples/0_Intro/bit_extract; make HIP_PATH=/opt/rocm/hip; ./bit_extract"
```

### Copy ROCm benchmark samples from container to $HOME/Documents on host
```
singularity run rocm431.ubuntu18.sif /bin/bash -c "cp -r /opt/rocm/hip/samples/ $HOME/Documents/"
```
##### Output
```
Container was created Tue Sep 21 17:56:14 UTC 2021
CWD: /home/USERHOME Launching: /bin/bash -c cp -r /opt/rocm/hip/samples/ /home/USERHOME/Documents/
```

### Running sample benchmark after above copy
```
singularity run rocm431.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/samples/0_Intro/bit_extract; make HIP_PATH=/opt/rocm/hip; ./bit_extract"
```
##### Output
```
Container was created Tue Sep 21 17:56:14 UTC 2021
CWD: /home/USERNAME Launching: /bin/bash -c cd /home/USERNAME/Documents/samples/0_Intro/bit_extract; make HIP_PATH=/opt/rocm/hip; ./bit_extract
/opt/rocm/hip/bin/hipcc  bit_extract.cpp -o bit_extract
info: running on device #0 Device 66a1
info: allocate host mem (  7.63 MB)
info: allocate device mem (  7.63 MB)
info: copy Host2Device
info: launch 'bit_extract_kernel'
info: copy Device2Host
info: check result
PASSED!
```
