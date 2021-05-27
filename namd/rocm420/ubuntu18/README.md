```
# Copyright (c) 2021 Advanced Micro Devices, Inc. All Rights Reserved.
```
# ROCm-4.2.0-based NAMD Container

## 1.0 How to Use Docker Container
#### On Ubuntu 18/20 HWE, CentOS/RHEL 7.x, or SLES 15 SP2, use docker:
```
# Launch container in interactive mode, bash shell
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/namd3-rocm420-ubuntu18 bash
```
#### On CentOS/RHEL 8.x, use podman:
```
# Launch container in interactive mode, bash shell
sudo podman run -it --privileged docker://amddcgpuce/namd3-rocm420-ubuntu18 bash
```
##### Image Name + Tag | Description
```
    namd3-rocm420-ubuntu18   -->   NAMD-3 based on ROCm v4.2.0 On Ubuntu18
```

## 2.0 Steps to build Singularity container from docker image
#### Download Singularity Definition File
```
# Download Singularity Definition file
wget -O namd3.rocm420.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/namd/rocm420/ubuntu18/namd3.rocm420.ubuntu18.sdf
```
#### Build Singularity Image File (SIF)
##### On Ubuntu 18.04/20.04 HWE with singularity installed under /usr/local/bin
```
sudo /usr/local/bin/singularity build namd3.rocm420.ubuntu18.sif namd3.rocm420.ubuntu18.sdf
```
##### On CentOS/RHEL 8 with singularity RPM installed
```
sudo singularity build namd3.rocm420.ubuntu18.sif namd3.rocm420.ubuntu18.sdf
```

## 3.0 Example Usage of NAMD Docker Container
#### Benchmark examples
```
# Launch container in interactive mode, bash shell on a Ubuntu18 system
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/namd3-rocm420-ubuntu18 bash

# Example usage
cd /opt/namd/NAMD_benchmarks
export PATH=$PATH:/opt/namd/Linux-x86_64-g++.hip
python3 run_benchmarks.py -b apoa1 -c 2-48:2 -d 0
```

## 4.0 Example Usage of NAMD Singularity Container
#### Run Help
```
singularity run-help namd3.rocm420.ubuntu18.sif
```
##### Output
```
    singularity run namd3.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/namd; cp -r NAMD_benchmarks $HOME/Documents/"
    singularity run namd3.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/NAMD_benchmarks; python3 run_benchmarks.py -b apoa1 -c 2-48:2 -d 0"
```
#### Copy NAMD benchmark samples from container to $HOME/Documents on host
```
singularity run namd3.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/namd; cp -r NAMD_benchmarks $HOME/Documents/"
```
##### Output
```
Container was created Wed May 19 22:12:57 UTC 2021
CWD: /opt/namd Launching: /bin/bash -c cd /opt/namd; cp -r NAMD_benchmarks /home/USERHOME/Documents/
```
#### Running sample benchmark
```
singularity run namd3.rocm420.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/NAMD_benchmarks; python3 run_benchmarks.py -b apoa1 -c 2-48:2 -d 0"
```
##### Output
```
Container was created Wed May 19 22:12:57 UTC 2021
CWD: /opt/namd Launching: /bin/bash -c cd /home/USERHOME/Documents/NAMD_benchmarks; python3 run_benchmarks.py -b apoa1 -c 2-48:2 -d 0
Executing: /opt/namd/Linux-x86_64-g++.hip/namd3 /home/USERHOME/Documents/NAMD_benchmarks/apoa1/apoa1_nve_cuda.namd +p 2 +pemap 0-1 +setcpuaffinity +isomalloc_sync +devices 0
Depth set on single layer image geometry.
Depth set on single layer image geometry.
Depth set on single layer image geometry.
Depth set on single layer image geometry.
Depth set on single layer image geometry.
Depth set on single layer image geometry.
...output snipped...
```

## 5.0 Incompatible ROCm Environment Check Message (NEW)
### ROCm 4.1 Kernel Modules (rock-dkms, rock-dkms-firmware) or newer is required on MI50/MI60 platforms to run ROCm 4.1 or newer user space stack 

#### Docker Run Failure Message On Incompatible ROCm Environment
```
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/namd3-rocm420-ubuntu18 bash
```
##### Output
```
Error: Incompatible ROCm environment. The Docker container
requires the latest kernel driver to operate correctly.

Upgrade the ROCm kernel to v4.1 or newer, or use a container
tagged for v4.0.1 or older.

To inspect the version of the installed kernel driver, run either:
    . dpkg --status rock-dkms [Debian-based]
    . rpm -ql rock-dkms [RHEL, SUSE, and others]

To install or update the driver, follow the installation instructions at:
    https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html
```

#### Singularity Run Failure Message On Incompatible ROCm Environment
```
singularity run namd3.rocm420.ubuntu18.sif /bin/bash -c "cd /opt/namd; cp -r NAMD_benchmarks $HOME/Documents/"
```
##### Output
```
Container was created Wed May 19 22:12:57 UTC 2021

Error: Incompatible ROCm environment. The Docker container 
requires the latest kernel driver to operate correctly.

Upgrade the ROCm kernel to v4.1 or newer, or use a container 
tagged for v4.0.1 or older.

To inspect the version of the installed kernel driver, run either:
    . dpkg --status rock-dkms [Debian-based]
    . rpm -ql rock-dkms [RHEL, SUSE, and others]

To install or update the driver, follow the installation instructions at:
    https://rocmdocs.amd.com/en/latest/Installation_Guide/Installation-Guide.html
```
