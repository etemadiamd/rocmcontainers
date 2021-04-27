# ROCm-4.1.0-based LAMMPS Container

## 1.0 How to Use Docker Container
#### On Ubuntu 18/20 HWE, CentOS/RHEL 7.x, or SLES 15 SP2, use docker:
```
# Launch container in interactive mode, bash shell
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/lammps-rocm410-ubuntu18 bash
```
#### On CentOS/RHEL 8.x, use podman:
```
# Launch container in interactive mode, bash shell
sudo podman run -it --privileged docker://amddcgpuce/lammps-rocm410-ubuntu18 bash
```
##### Image Name + Tag | Description
```
    lammps-rocm410-ubuntu18:version1   -->   LAMMPS based on ROCm v4.1.0 On Ubuntu18 (Version 1)
```

## 2.0 Steps to build Singularity container from docker image
#### Download Singularity Definition File
```
# Download Singularity Definition file
wget -O lammps.rocm410.ubuntu18.sdf --no-check-certificate https://raw.githubusercontent.com/amddcgpuce/rocmcontainers/main/lammps/rocm410/ubuntu18/lammps.rocm410.ubuntu18.sdf
```
#### Build Singularity Image File (SIF)
##### On Ubuntu 18.04/20.04 HWE with singularity installed under /usr/local/bin
```
sudo /usr/local/bin/singularity build lammps.rocm410.ubuntu18.sif lammps.rocm410.ubuntu18.sdf
```
##### On CentOS/RHEL 8 with singularity RPM installed
```
sudo singularity build lammps.rocm410.ubuntu18.sif lammps.rocm410.ubuntu18.sdf
```

## 3.0 Example Usage of LAMMPS Singularity Container
#### Run Help
```
singularity run-help lammps.rocm410.ubuntu18.sif
```
##### Output
```
    singularity run lammps.rocm410.ubuntu18.sif /bin/bash -c "cd /opt/lammps_install/lammps; cp -r examples/melt $HOME/Documents/"
    singularity run lammps.rocm410.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/melt; /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1"
```
#### Copy LAMMPS benchmark samples from container to $HOME/Documents on host
```
singularity run lammps.rocm410.ubuntu18.sif /bin/bash -c "cd /opt/lammps_install/lammps; cp -r examples/melt $HOME/Documents/"
```
##### Output
```
Container was created Tue Apr 27 18:04:50 UTC 2021
CWD: /opt/lammps_install/lammps Launching: /bin/bash -c cd /opt/lammps_install/lammps; cp -r examples/melt /home/USERHOME/Documents/
```
#### Running sample benchmark#1
```
singularity run lammps.rocm410.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/melt; /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1"
```
##### Output
```
Container was created Tue Apr 27 18:04:50 UTC 2021
CWD: /opt/lammps_install/lammps Launching: /bin/bash -c cd /home/USERHOME/Documents/melt; /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1
--------------------------------------------------------------------------
...output snipped...
```

## 4.0 Incompatible ROCm Environment Check Message (NEW)
### ROCm 4.1 Kernel Modules (rock-dkms, rock-dkms-firmware) or newer is required on MI50/MI60 platforms to run ROCm 4.1 or newer user space stack 

#### Docker Run Failure Message On Incompatible ROCm Environment
```
sudo docker run -it --privileged --ipc=host --network=host --device=/dev/kfd --device=/dev/dri --group-add video --cap-add=SYS_PTRACE --security-opt seccomp=unconfined amddcgpuce/lammps-rocm410-ubuntu18 bash
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
singularity run lammps.rocm410.ubuntu18.sif /bin/bash -c "cd $HOME/Documents/melt; /opt/ompi/bin/mpirun -np 1 lmp  -in in.melt -sf gpu -pk gpu 1"
```
##### Output
```
Container was created Tue Apr 27 18:04:50 UTC 2021

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
